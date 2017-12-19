#!/usr/bin/env bash
set -uex

retry=60
interval=1

while ! netstat -ntpl | grep -q ':6640' ; do
    if [[ ${retry} -gt 0 ]]; then
        ((retry-=1))
        echo "WARN: Failed to find ovs lisntening on 6640, retry in $interval second."
        sleep ${interval}
    else
        echo "CRITICAL: Failed to find ovs lisntening on 6640 in 60 seconds."
        exit 1
    fi
done

echo "INFO: openvswitch is ready."
