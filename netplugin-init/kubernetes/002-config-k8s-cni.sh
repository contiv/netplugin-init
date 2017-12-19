#!/usr/bin/env bash
set -uexo pipefail

if [ "$CONTIV_ROLE" = "netplugin" ]; then
    mkdir -p /opt/cni/bin /etc/cni/net.d/
    cp /contiv/bin/contivk8s /opt/cni/bin/
    echo ${CONTIV_CNI_CONFIG} > /etc/cni/net.d/1-contiv.conf
    echo "INFO: Created contiv config:"
    cat /etc/cni/net.d/1-contiv.conf
fi
