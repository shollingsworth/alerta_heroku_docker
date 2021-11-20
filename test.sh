#!/usr/bin/env bash
# set -euo pipefail
# IFS=$'\n\t'

# sudo rm -rfv ./pg-data/
# docker build -t alerta-test -f ./alerta.Dockerfile .
export TEST="foo"
if [[ "${TEST}-" == "-" ]]; then
    echo "TEST not set"
    exit 1
else
    echo "OK"
fi
