#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

sudo rm -rfv ./pg-data/
docker build -t alerta-test -f ./alerta.Dockerfile .
