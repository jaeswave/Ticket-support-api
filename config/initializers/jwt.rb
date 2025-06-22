# config/initializers/jwt.rb
JWT_SECRET = Rails.application.credentials.jwt_secret || Rails.application.credentials.secret_key_base