#!/usr/bin/env bash
set -o errexit  # Exit on error
bundle install  # Install gems
# Optional (only if using a database):
bundle exec rake db:migrate