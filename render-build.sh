#!/bin/bash
set -e

# Nuclear clean install
export BUNDLE_FORCE_RUBY_PLATFORM=1
bundle config set no-cache 'true'
bundle config set deployment 'true'
bundle install --jobs=4 --without development test --path vendor/bundle --clean