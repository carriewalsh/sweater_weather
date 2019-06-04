class Api::V1::FavoritesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(api_key: create_params[:api_key])
    city = City.find(create_params[:location])
    if user && city
      UserCity.create(user_id: user.id, city_id: city.id)
      render json: { success: "Favorited" }, status: 200
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def show
    user = User.find_by(api_key: create_params[:api_key])
    favorites = User.cities
    if user
      render json: UserCitySerializer.new(favorites)
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def destroy

  end

  private

    def create_params
      params.permit(:location, :api_key)
    end
end
