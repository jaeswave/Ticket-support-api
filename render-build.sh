#!/bin/bash
# Disable asset pipeline completely
export DISABLE_ASSET_COMPILATION=true

# Install gems
bundle config set without 'development test'
bundle install

# Only add this if using a database:
# bundle exec rake db:migrate