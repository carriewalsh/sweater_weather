class Api::V1::ForecastsController < ApplicationController
  def show
    city = CityCreatorService.new(city_params).find_or_create_city
  end

  private

    def city_params
      params.permit("location")
    end

end
