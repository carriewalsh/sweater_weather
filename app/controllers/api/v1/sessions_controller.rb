class Api::V1::SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      render json: {
        status: 200,
        body: {
          "api_key": @user.api_key
        }
      }
    else
      render json: {
        error: "Forbidden",
        status: 403
      }
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
