#!/bin/bash
set -e
# Clean install with no cache
bundle config set force_ruby_platform true
bundle install --without development test --path vendor/bundle --clean