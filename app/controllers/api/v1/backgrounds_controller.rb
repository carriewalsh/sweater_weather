class Api::V1::BackgroundsController < ApplicationController
  def show
    city = CityCreatorService.new(city_params[:location])
    city.find_or_create
    render json: CitySerializer.new(city, {
      include: [:photo]
      })
  end

  private

    def city_params
      params.permit(:location)
    end
end
