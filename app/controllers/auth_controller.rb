require Rails.root.join('app/services/jwt_service')

class AuthController < ApplicationController
  before_action :authenticate_user!, only: [:me]  # ✅ Ensure token is checked

  def login
    user = User.find_by(email: params[:email], role: params[:role])

    if user&.authenticate(params[:password])
      if params[:role] == "agent" && user.invite_code != params[:invite_code]
        return render json: { error: "Invalid invite code" }, status: :unauthorized
      end

      token = JwtService.encode(user_id: user.id, role: user.role)
      response.headers['Authorization'] = "Bearer #{token}"

      render json: { message: "Welcome" }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  def me
    render json: {
      name: current_user.name,
      email: current_user.email,
      role: current_user.role
    }
  end
end
