class Api::V1::ForecastsController < ApplicationController
  def show
    city = CityCreatorService.new(city_params).find_or_create_city
    current = CityCurrent.where(city_id: city.id)
    astronomy = CitySteady.where(city_id: city.id)
    forecast = CityDay.where(city_id: city.id)
  end

  private

    def city_params
      params.permit("location")
    end

end
