class UsersController < ApplicationController
    def create
      user = User.new(user_params)
  
      if user.role.blank?
        if user.invite_code.present?
          user.role = :agent
        else
          user.role = :customer
        end
      end
  
      if user.save
        render json: { message: "User created", user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :invite_code, :role)
    end
  end
  