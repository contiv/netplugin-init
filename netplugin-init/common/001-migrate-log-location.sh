#!/usr/bin/env bash
set -uex

mkdir -p /opt/contiv/ /var/log/contiv

if [ -d /var/contiv/log ]; then
    # /var/contiv/log/ is deprecated, move all data to /var/log/contiv
    cp -a /var/contiv/log/* /var/log/contiv/
    echo "INFO: Copied contiv log from /var/contiv/log (deprecated) to /var/log/contiv"
fi

echo "INFO: Log migration competed."
