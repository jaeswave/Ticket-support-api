source "https://rubygems.org"

# ===== PLATFORM CONFIGURATION =====
ruby "3.2.8"  # Must match Render's Ruby version
platforms :ruby, :x86_64_linux do
  gem "pg", "~> 1.1"  # PostgreSQL
  gem "puma", ">= 5.0"  # Web server
end
# ================================

gem "rails", "~> 8.0.2"

# Database-backed adapters
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "sprockets-rails"

# Performance gems
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

# Windows-specific
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem 'dotenv-rails'
  gem 'bcrypt', '~> 3.1.7'
  gem 'jwt'
  gem "graphql"
  gem 'graphiql-rails', '~> 1.8'
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem 'whenever', require: false
  gem "rubocop-rails-omakase", require: false
end