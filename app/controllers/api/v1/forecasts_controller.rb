class Api::V1::ForecastsController < ApplicationController
  def show
    city = CityCreatorService.new(city_params).find_or_create_city
    render json: {
      city: CitySerializer.new(city),
      current: CityCurrentSerializer.new(CityCurrent.where(city_id: city.id)),
      steady: CitySteadySerializer.new(CitySteady.where(city_id: city.id)),
      forecast: CityDaySerializer.new(CityDay.where(city_id: city.id))
    }
  end

  private

    def city_params
      params.permit("location")
    end

end
