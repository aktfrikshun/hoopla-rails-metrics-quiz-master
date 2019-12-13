#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "building docker image for development"
docker build . -t hoopla:v1.0
