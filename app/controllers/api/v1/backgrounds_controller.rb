class Api::V1::BackgroundsController < ApplicationController
  def show
    city = CityCreatorService.new(city_params[:location]).find_or_create
    render json: PhotoSerializer.new(city.photo, {
      include: [:city]
      })
  end

  private

    def city_params
      params.permit(:location)
    end
end
