#!/usr/bin/env bash

set -exo pipefail

INIT_BASE="netplugin-init"

if [ -z "$CONTIV_ROLE" ]; then
    echo "CRITICAL: ENV CONTIV_ROLE must be set"
    echo "CRITICAL: Unknown contiv role"
    exit 1
elif [ "$CONTIV_ROLE" != "netmaster" ] && [ "$CONTIV_ROLE" != "netplugin" ]; then
    echo "CRITICAL: ENV CONTIV_ROLE must be in [netmaster, netplugin]"
    echo "CRITICAL: Unknown contiv role"
    exit 1
fi
echo "INFO: Running netplugin init as $CONTIV_ROLE"

if [ -z "$CONTIV_MODE" ]; then
    echo "CRITICAL: ENV CONTIV_MODE must be set"
    exit 1
elif [ ! -d "/$INIT_BASE/$CONTIV_MODE" ]; then
    echo "CRITICAL: Unsupported contiv mode"
    exit 1
fi

set -u

run_init() {
    local f
    local _dir
    _dir=$1; shift

    if [ -z "${_dir}" ]; then
        return
    fi

    echo "INFO: Running $CONTIV_ROLE ${_dir} init scripts"

    for f in "/$INIT_BASE/${_dir}"/*.sh; do
        echo "INFO: Running $f"
        "$f" "$@"
    done
}

run_init "common" $@

run_init "$CONTIV_MODE" $@
