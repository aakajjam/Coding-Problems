#!/bin/sh

if [[ -z "${HTTPS_PROXY}" ]]; then
  echo "*** No proxy is set up for this contaienr"
else
    # Format of ${HTTPS_PROXY}: https://127.0.0.1:9999
    proxy_ip=$(echo ${HTTPS_PROXY} | sed -E 's/http[s]{0,1}\:\/\/([^\:]*).*/\1/')
    proxy_port=$(echo ${HTTPS_PROXY} | sed -E 's/http[s]{0,1}\:\/\/[^\:]*\:(.*)/\1/')

    echo "**** STARTING PROXY ${HTTPS_PROXY} at address: $proxy_ip port: $proxy_port ****"
    echo "*** Generating self-signed CA certificate..."
    timeout 5 /mitmproxy/mitmdump -q --listen-port $proxy_port
    echo "*** Trusting certificates"
    cp ~/.mitmproxy/* /etc/pki/ca-trust/source/anchors/
    update-ca-trust
    echo "*** Starting mitmproxy on port $proxy_port + script ${MITMPROXY_INTERCEPTOR_SCRIPT}"
    /mitmproxy/mitmdump --listen-port $proxy_port -q -s ${MITMPROXY_INTERCEPTOR_SCRIPT} &
    sleep 5    
fi

HOME=${ROBOT_WORK_DIR}

# Pass the screen size to the robot options, in order to size the window properly, for screenshots
if [[ ! "$ROBOT_OPTIONS" =~ \-\-variable\ *SCREEN_WIDTH\:[^\ ]+ ]] && [[ $SCREEN_WIDTH =~ ^[0-9]+$ ]]; then 
    ROBOT_OPTIONS="${ROBOT_OPTIONS} --variable SCREEN_WIDTH:${SCREEN_WIDTH}";
else
    #default width, if not specified, or invalid value
    ROBOT_OPTIONS="${ROBOT_OPTIONS} --variable SCREEN_WIDTH:1920";
fi
if [[ ! "$ROBOT_OPTIONS" =~ \-\-variable\ *SCREEN_HEIGHT\:[^\ ]+ ]] && [[ $SCREEN_HEIGHT =~ ^[0-9]+$ ]]; then 
    ROBOT_OPTIONS="${ROBOT_OPTIONS} --variable SCREEN_HEIGHT:${SCREEN_HEIGHT}";
else
    #default height, if not specified, or invalid value
    ROBOT_OPTIONS="${ROBOT_OPTIONS} --variable SCREEN_HEIGHT:1080";
fi

if [ "${ROBOT_TEST_RUN_ID}" = "" ]
then
    ROBOT_REPORTS_FINAL_DIR="${ROBOT_REPORTS_DIR}"
else
    REPORTS_DIR_HAS_TRAILING_SLASH=`echo ${ROBOT_REPORTS_DIR} | grep '/$'`

    if [ ${REPORTS_DIR_HAS_TRAILING_SLASH} -eq 0 ]
    then
        ROBOT_REPORTS_FINAL_DIR="${ROBOT_REPORTS_DIR}${ROBOT_TEST_RUN_ID}"
    else
        ROBOT_REPORTS_FINAL_DIR="${ROBOT_REPORTS_DIR}/${ROBOT_TEST_RUN_ID}"
    fi
fi

# Ensure the output folder exists
mkdir -p ${ROBOT_REPORTS_FINAL_DIR}

# No need for the overhead of Pabot if no parallelisation is required
if [ $ROBOT_THREADS -eq 1 ]
then
    xvfb-run \
        --server-args="-screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} -ac" \
        robot \
        --outputDir $ROBOT_REPORTS_FINAL_DIR \
        ${ROBOT_OPTIONS} \
        $ROBOT_TESTS_DIR
else
    xvfb-run \
        --server-args="-screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} -ac" \
        pabot \
        --verbose \
        --processes $ROBOT_THREADS \
        ${PABOT_OPTIONS} \
        --outputDir $ROBOT_REPORTS_FINAL_DIR \
        ${ROBOT_OPTIONS} \
        $ROBOT_TESTS_DIR
fi

ROBOT_EXIT_CODE=$?

if [ ${AWS_UPLOAD_TO_S3} = true ]
then
    echo "Uploading report to AWS S3..."
    aws s3 sync $ROBOT_REPORTS_FINAL_DIR/ s3://${AWS_BUCKET_NAME}/robot-reports/
    echo "Reports have been successfully uploaded to AWS S3!"
fi

exit $ROBOT_EXIT_CODE
