# app/services/jwt_service.rb
class JwtService
    ALGORITHM = 'HS256'
  
    SECRET_KEY = ENV.fetch('JWT_SECRET_KEY') do
      Rails.application.credentials.jwt_secret || 'fallback_dev_secret'
    end
  
    def self.encode(payload, exp = 24.hours.from_now)
      payload = payload.dup
      payload[:exp] = exp.to_i  # Set expiration
      JWT.encode(payload, SECRET_KEY, ALGORITHM)
    end
  
    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY, true, { algorithm: ALGORITHM })[0]
      ActiveSupport::HashWithIndifferentAccess.new(decoded)
    rescue JWT::DecodeError, JWT::ExpiredSignature => e
      nil
    end
  end