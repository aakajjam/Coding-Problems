#!/bin/sh

if [[ ! -z "${HTTPS_PROXY}" ]]; then
    proxy_arg=--proxy-server="${HTTPS_PROXY}"
fi

exec /usr/lib64/chromium-browser/chromium-browser-original --disable-gpu --disable-dev-shm-usage --no-sandbox --headless $proxy_arg "$@"

