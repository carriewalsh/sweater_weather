class Api::V1::AntipodesController < ApplicationController
  def show
    city = CityCreatorService.new(params[:loc]).find_or_create_city
    render json: AntipodeSerializer.new(city)
  end
end
