# app/controllers/concerns/authenticable.rb
module Authenticable
    extend ActiveSupport::Concern
  
    included do
    #   helper_method :current_user
    end
  
    def current_user
      @current_user ||= begin
        token = request.headers['Authorization']&.split(' ')&.last
        payload = JwtService.decode(token) if token
        User.find_by(id: payload[:user_id]) if payload
      end
    end
  
    def authenticate_user!
      render json: { error: "Unauthorized" }, status: :unauthorized unless current_user
    end
  end