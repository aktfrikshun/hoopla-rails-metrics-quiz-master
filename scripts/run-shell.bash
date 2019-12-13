#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "opening bash shell"
docker run -i -t -v /srv/hoopla-rails-metrics-quiz-master:/hoopla-rails-metrics-quiz-master hoopla:v1.0 bash
