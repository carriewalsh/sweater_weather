class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  
  def create
    @user = User.create(user_params)
    if @user.save
      @user.update(api_key: SecureRandom.hex(2))
      render json: {
          "api_key": @user.api_key
        }, status: 201
    else
      render json: {
        error: "User already exists"
      },   status: 409
    end

  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
