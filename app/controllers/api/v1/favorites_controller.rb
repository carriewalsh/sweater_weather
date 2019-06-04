class Api::V1::FavoritesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(api_key: favorite_params[:api_key])
    city = City.find(favorite_params[:location])
    current = CityCurrent.find_by(city_id: city)
    if user && city
      UserCity.create!(user_id: user.id, city_id: city.id, city_current_id: current.id)
      render json: { success: "Favorited" }, status: 200
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def show
    user = User.find_by(api_key: favorite_params[:api_key])
    favorites = user.cities
    if user
      render json: UserCitySerializer.new(user,favorites).jsonify, status: 200
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def destroy
    user = User.find_by(api_key: favorite_params[:api_key])
    UserCity.find_by(city_id: favorite_params[:location]).destroy
    favorites = user.cities
    if user
      render json: UserCitySerializer.new(user,favorites).jsonify, status: 200
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  private

    def favorite_params
      params.permit(:location, :api_key)
    end
end
