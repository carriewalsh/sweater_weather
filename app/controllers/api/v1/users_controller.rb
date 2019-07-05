class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    if user_params[:password] == user_params[:password_confirmation]
      @user = User.create(user_params)
      if @user.save
        @user.update(api_key: SecureRandom.hex(2))
        render json: { "api_key": @user.api_key }, status: 201
      elsif User.find_by(email: user_params[:email])
        render json: { error: "User already exists" },
                       status: 409
      else
        render json: { error: "Bad Request" },
                       status: 400
      end
    else
      render json: { error: "Passwords must match" },
                     status: 409
    end

  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
