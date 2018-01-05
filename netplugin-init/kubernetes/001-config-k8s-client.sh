#!/usr/bin/env bash
set -uexo pipefail

K8S_DEST="/var/contiv/config/contiv.json"
TMP_DEST=$(mktemp)
echo "INFO: Setting kubernetes configs"
mkdir -p /var/contiv/config
echo ${CONTIV_K8S_CONFIG} > $TMP_DEST

SERVICEACCOUNT_TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)

sed -i s/__KUBERNETES_SERVICE_HOST__/${KUBERNETES_SERVICE_HOST}/g $TMP_DEST
sed -i s/__KUBERNETES_SERVICE_PORT__/${KUBERNETES_SERVICE_PORT}/g $TMP_DEST

echo "INFO: Got K8S configs"
cat $TMP_DEST

# put token after print out the contains
sed -i s/__SERVICEACCOUNT_TOKEN__/${SERVICEACCOUNT_TOKEN:-}/g $TMP_DEST

mv $TMP_DEST $K8S_DEST
