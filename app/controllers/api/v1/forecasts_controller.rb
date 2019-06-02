class Api::V1::ForecastsController < ApplicationController
  def show
    city = CityCreatorService.new(city_params).find_or_create_city
    render json: {
      city: CitySerializer.new(city),
      current: CityCurrentSerializer.new(CurrentService.new(city).create_or_update),
      steady: CitySteadySerializer.new(SteadyService.new(city).create_or_update),
      forecast: CityDaySerializer.new(CityDayService.new(city).create_or_update)
    }
  end

  private

    def city_params
      params.permit("location")
    end

end
