#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Opening rails console...."
docker run -i -t -v /srv/hoopla-rails-metrics-quiz-master:/hoopla-rails-metrics-quiz-master hoopla:v1.0 rails console
require 'uom_conversion'
