#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running tests"
docker run -i  -v /srv/hoopla-rails-metrics-quiz-master:/hoopla-rails-metrics-quiz-master hoopla:v1.0 rspec
