FROM fedora:36

LABEL MAINTAINER="engineering@skysql.com"
LABEL description="Robot Framework in Docker."

# Set the reports directory environment variable
ENV ROBOT_REPORTS_DIR="/opt/robotframework/reports"

# Set the tests directory environment variable
ENV ROBOT_TESTS_DIR="/opt/robotframework/tests"

# Set the working directory environment variable
ENV ROBOT_WORK_DIR="/opt/robotframework/temp"

# Setup X Window Virtual Framebuffer
ENV SCREEN_COLOUR_DEPTH=24
ENV SCREEN_HEIGHT=1080
ENV SCREEN_WIDTH=1920

# Set number of threads for parallel execution
# By default, no parallelisation
ENV ROBOT_THREADS=1

# Dependency versions
ENV AXE_SELENIUM_LIBRARY_VERSION=2.1.6
ENV BROWSER_LIBRARY_VERSION=12.2.0
ENV CHROMIUM_VERSION=110.0
ENV FIREFOX_VERSION=110.0
ENV GECKO_DRIVER_VERSION=v0.32.0
ENV PABOT_VERSION=2.5.2
ENV ROBOT_FRAMEWORK_VERSION=5.0
ENV SELENIUM_LIBRARY_VERSION=6.0.0
ENV RF_REQUESTS_LIBRARY_VERSION=0.9.5
ENV MYSQL_CONNECTOR_PYTHON_VERSION=8.0.29
ENV EXCELLIB_VERSION=2.0.1
ENV MOZ_HEADLESS=1
ENV AWS_UPLOAD_TO_S3=false

# Install system dependencies
RUN dnf upgrade -y --refresh \
  && dnf install -y \
    chromedriver-${CHROMIUM_VERSION}* \
    chromium-${CHROMIUM_VERSION}* \
    chromium-headless-${CHROMIUM_VERSION}* \
    firefox-${FIREFOX_VERSION}* \
    npm \
    nodejs \
    python3-pip \
    python3-devel \
    tzdata \
    gcc \
    xorg-x11-server-Xvfb-${XVFB_VERSION}* \
  && dnf clean all

# Install Robot Framework and associated libraries
RUN pip3 install \
  --no-cache-dir \
  robotframework==$ROBOT_FRAMEWORK_VERSION \
  robotframework-browser==$BROWSER_LIBRARY_VERSION \
  robotframework-pabot==$PABOT_VERSION \
  robotframework-seleniumlibrary==$SELENIUM_LIBRARY_VERSION \
  robotframework-requests==$RF_REQUESTS_LIBRARY_VERSION \
  robotframework-xvfb \
  robotframework-excellib==$EXCELLIB_VERSION \
  axe-selenium-python==$AXE_SELENIUM_LIBRARY_VERSION \
  PyYAML 

# Gecko drivers
RUN dnf install -y \
    wget \
  # Download Gecko drivers directly from the GitHub repository
  && wget -q "https://github.com/mozilla/geckodriver/releases/download/$GECKO_DRIVER_VERSION/geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz" \
  && tar xzf geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz \
  && mkdir -p /opt/robotframework/drivers/ \
  && mv geckodriver /opt/robotframework/drivers/geckodriver \
  && rm geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz \
  && dnf remove -y \
    wget \
  && dnf clean all

# Install the Node dependencies for the Browser library
# FIXME: Playright currently doesn't support relying on system browsers, which is why the `--skip-browsers` parameter cannot be used here.
RUN rfbrowser init \
  && ln -sf /usr/lib64/libstdc++.so.6 /usr/local/lib/python3.10/site-packages/Browser/wrapper/node_modules/playwright-core/.local-browsers/firefox-1316/firefox/libstdc++.so.6

# Install mariadb utils and connectors
RUN dnf install -y mariadb mariadb-server-utils pwgen mariadb-devel mysql-devel \
 && pip3 install --no-cache-dir mysqlclient mysql-connector-python==$MYSQL_CONNECTOR_PYTHON_VERSION


# Prepare binaries to be executed (moved)
COPY bin/chromedriver.sh /opt/robotframework/bin/chromedriver
COPY bin/chromium-browser.sh /opt/robotframework/bin/chromium-browser
COPY bin/run-tests-in-virtual-screen.sh /opt/robotframework/bin/

# FIXME: below is a workaround, as the path is ignored
RUN mv /usr/lib64/chromium-browser/chromium-browser /usr/lib64/chromium-browser/chromium-browser-original \
  && ln -sfv /opt/robotframework/bin/chromium-browser /usr/lib64/chromium-browser/chromium-browser

# Update system path
ENV PATH=/opt/robotframework/bin:/opt/robotframework/drivers:$PATH

# Set up a volume for the generated reports
VOLUME ${ROBOT_REPORTS_DIR}

# A dedicated work folder to allow for the creation of temporary files
WORKDIR ${ROBOT_WORK_DIR}

ENV MITMPROXY_INTERCEPTOR_SCRIPT=/mitmproxy/interceptor.py
RUN cd / \
  && curl https://snapshots.mitmproxy.org/9.0.1/mitmproxy-9.0.1-linux.tar.gz -o /mitmproxy.tar.gz \
  && mkdir /mitmproxy \
  && tar -xf /mitmproxy.tar.gz -C /mitmproxy \
  && echo "from mitmproxy import http" > ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "import logging" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "import os" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "def request(flow: http.HTTPFlow) -> None:" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "        logging.basicConfig(filename=os.environ['ROBOT_REPORTS_DIR'] + \"/mitmproxy.log\", encoding=\"utf-8\", level=logging.INFO, force=True, format=\"%(asctime)s %(message)s\")" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "        if os.environ['CF_ACCESS_CLIENT_ID']:"  >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "                flow.request.headers[\"cf-access-client-id\"] = os.environ['CF_ACCESS_CLIENT_ID']" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "        if os.environ['CF_ACCESS_CLIENT_SECRET']:"  >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "                flow.request.headers[\"cf-access-client-secret\"] = os.environ['CF_ACCESS_CLIENT_SECRET']" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "        logging.info(\"mitmproxy intercepted request: \" + flow.request.host + flow.request.path)" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "        logging.info(\"===== Request headers: =====\")" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "        for k, v in flow.request.headers.items():" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} \
  && echo "                logging.info(\"===== \" + k.upper() + \" -> \" + v)" >> ${MITMPROXY_INTERCEPTOR_SCRIPT} 

# Execute all robot tests
CMD ["run-tests-in-virtual-screen.sh"]
