class Api::V1::FavoritesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :user?

  def create
    if City.where(id: favorite_params[:location])[0] == nil
      render json: { error: "City ID not in database" }, status: 409
    else
      city = City.find(favorite_params[:location])
      current = CityCurrent.find_by(city_id: city)
      if UserCity.where(city_id: city.id)[0]
        render json: { message: "#{city.name_string} is already in favorites" }, status: 200
      else
        UserCity.create!(user_id: @user.id, city_id: city.id, city_current_id: current.id)
        render json: { success: "#{city.name_string} has been favorited." }, status: 200
      end
    end
  end

  def show
    favorites = @user.cities
    render json: UserCitySerializer.new(@user,favorites).jsonify, status: 200
  end

  def destroy
    if City.where(id: favorite_params[:location])[0] == nil
      render json: { error: "City ID not in database" }, status: 409
    else
      city = UserCity.find_by(city_id: favorite_params[:location])
      if city
        UserCity.find_by(city_id: favorite_params[:location]).destroy
        favorites = @user.cities
        render json: { success: "#{City.where(id: city.city_id)[0].name_string} has been removed from favorites" }, status: 200
      else
        render json: { error: "#{City.where(id: favorite_params[:location])[0].name_string} is not in favorites." }, status: 409
      end
    end
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
