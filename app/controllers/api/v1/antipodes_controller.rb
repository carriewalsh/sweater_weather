class Api::V1::AntipodesController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    antipode = AntipodeService.new(params[:loc]).create_antipode
    if antipode
      render json: AntipodeSerializer.new(antipode, include: [:city, :city_current])
    elsif !antipode
      render json: { message: "Antipode cannot be found" }, status: 200
    end
  end
end
