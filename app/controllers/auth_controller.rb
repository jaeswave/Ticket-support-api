require Rails.root.join('app/services/jwt_service')


class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email], role: params[:role])

    # Authentication check
    if user&.authenticate(params[:password])
      # Special check for agents
      if params[:role] == "agent" && user.invite_code != params[:invite_code]
        return render json: { error: "Invalid invite code" }, status: :unauthorized
      end

      # Create token using JwtService
      token = JwtService.encode(
        user_id: user.id,
        role: user.role
      )

          # Set token in the Authorization header (standard for JWT)
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
end