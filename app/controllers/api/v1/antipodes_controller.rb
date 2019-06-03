class Api::V1::AntipodesController < ApplicationController
  def show
    city = CityCreatorService.new(params[:loc]).find_or_create_city
    antipode = AntipodeService
    render json: AntipodeSerializer.new(city)
  end
end
