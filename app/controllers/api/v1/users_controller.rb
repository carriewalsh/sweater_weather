class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.save
      @user.update(api_key: SecureRandom.hex(2))
      render json: {"api_key": @user.api_key}
    else
      flash[:notice] = "User already exists"
    end


  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
