class Api::V1::AntipodesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def show
    antipode = AntipodeService.new(params[:loc]).create_antipode
    render json: AntipodeSerializer.new(antipode, include: [:city, :city_current])
  end
end
