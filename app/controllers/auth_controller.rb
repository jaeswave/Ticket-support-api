class AuthController < ApplicationController
    SECRET_KEY = "supersecret123" 
  
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        payload = { user_id: user.id }
        token = JWT.encode(payload, SECRET_KEY, 'HS256')
        render json: { token: token }
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
  end
  