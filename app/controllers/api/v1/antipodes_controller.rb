class Api::V1::AntipodesController < ApplicationController
  def show
    antipode = AntipodeService.new(params[:loc]).create_antipode
    render json: AntipodeSerializer.new(antipode)
  end
end
