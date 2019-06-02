class Api::V1::BackgroundsController < ApplicationController
  def show
    city = CityCreatorService.new(city_params).find_or_create_city
    render json: CitySerializer.new(city, {
      include: [:photo]
      })
  end

  private

    def city_params
      params.permit(:location)
    end
end
