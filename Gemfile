source "https://rubygems.org"

ruby "~> 3.3.0"
gem "rails", "~> 7.1.3"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# Optional: Only if you're using them correctly
# gem "solid_cache"
# gem "solid_queue"
# gem "solid_cable"

# Only use these if you're deploying with Kamal
# gem "kamal", require: false
# gem "thruster", require: false

group :development, :test do
  gem "dotenv-rails"
  gem "bcrypt", "~> 3.1.7"
  gem "jwt"
  gem "graphql"
  gem "graphiql-rails", '~> 1.8'
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
