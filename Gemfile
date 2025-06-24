source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "sprockets-rails"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
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
# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'dotenv-rails'
  gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem "graphql"
gem 'graphiql-rails', '~> 1.8'


  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false
  gem 'whenever', require: false



  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end
