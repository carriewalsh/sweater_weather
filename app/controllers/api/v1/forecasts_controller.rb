class Api::V1::ForecastsController < ApplicationController
  def show
    city = CityCreatorService.new(city_params).find_or_create_city
    render json: CitySerializer.new(city, {
      include: [:city_steadies, :city_days, :city_current, :photo]
      })
  end

  private

    def city_params
      params.permit("location")
    end

end
