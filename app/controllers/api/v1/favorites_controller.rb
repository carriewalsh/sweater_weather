class Api::V1::FavoritesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :user?

  def create
    city = City.find(favorite_params[:location])
    current = CityCurrent.find_by(city_id: city)
    if city
      UserCity.create!(user_id: @user.id, city_id: city.id, city_current_id: current.id)
      render json: { success: "Favorited" }, status: 200
    end
  end

  def show
    favorites = @user.cities
    render json: UserCitySerializer.new(@user,favorites).jsonify, status: 200
  end

  def destroy
      UserCity.find_by(city_id: favorite_params[:location]).destroy
      favorites = @user.cities
      render json: UserCitySerializer.new(@user,favorites).jsonify, status: 200
  end

  private

    def favorite_params
      params.permit(:location, :api_key)
    end

    def user?
      @user = User.find_by(api_key: favorite_params[:api_key])
      unless @user
        render json: { error: "Unauthorized" }, status: 401
      else
        @user
      end
    end
end
