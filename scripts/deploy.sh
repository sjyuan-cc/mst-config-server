#! /usr/bin/env bash
set -x
set -e

export RANCHER_URL=http://10.202.129.3:8080/v2-beta/projects/1a5
export RANCHER_ACCESS_KEY=0776A1C81D57800F4CE9
export RANCHER_SECRET_KEY=Z2i8KcmfzeroaAy148wuPnxjyhwGxmxm3qZWsZC8

if [[ -z $DOCKER_REGISRTY ]]; then
  DOCKER_REGISRTY=10.202.129.3:5000
fi
IMAGE_NAME=${DOCKER_REGISRTY}/tw-ms-training/config-service:${GO_PIPELINE_COUNTER}

sed -i "s#<IMAGE_NAME>#$IMAGE_NAME#g" docker-compose.yml

rancher-compose -p mst-config-service up -d -c --upgrade
