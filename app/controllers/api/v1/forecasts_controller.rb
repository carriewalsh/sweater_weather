class Api::V1::ForecastsController < ApplicationController
  def show
    coordinates = LatLongService.new(city_params)
    city = City.find_or_create_by(latitude: coordinates[:lat], longitude: coordinates[:long])
  end

  private

    def city_params
      params.permit("location")
    end

end
