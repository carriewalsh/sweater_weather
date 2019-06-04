class Api::V1::FavoritesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(api_key: create_params[:api_key])
    city = City.find(create_params[:location])
    current = CityCurrent.find_by(city_id: city)
    if user && city
      UserCity.create!(user_id: user.id, city_id: city.id, city_current_id: current.id)
      render json: { success: "Favorited" }, status: 200
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def show
    user = User.find_by(api_key: create_params[:api_key])
    favorites = user.cities
    binding.pry
    if user
      render json: {
        favorites: favorites.to_json, include: :city_currents
      }
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def destroy
    user = User.find_by(api_key: create_params[:api_key])
    favorites = user.cities
    if user
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  private

    def create_params
      params.permit(:location, :api_key)
    end
end
