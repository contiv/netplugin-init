#!/usr/bin/env bash
set -uexo pipefail

if [ "$CONTIV_ROLE" = "netplugin" ]; then
    mkdir -p /etc/cni/net.d/
    echo ${CONTIV_CNI_CONFIG} > /etc/cni/net.d/1-contiv.conf
    echo "INFO: Created contiv config:"
    cat /etc/cni/net.d/1-contiv.conf
fi
