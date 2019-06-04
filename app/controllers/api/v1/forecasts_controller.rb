class Api::V1::ForecastsController < ApplicationController
  def show
    city = CityCreatorService.new(city_params[:location]).find_or_create_city
    if city.city_steadies.empty?
      CurrentService.new(city).create_or_update
      CityDayService.new(city).create_or_update
      SteadyService.new(city).create_or_update
    end
    render json: CitySerializer.new(city, {
      include: [:city_steadies, :city_days, :city_current, :photo]
      })
  end

  private

    def city_params
      params.permit("location")
    end

end
