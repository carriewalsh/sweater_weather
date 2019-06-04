class CurrentService
  include GetService
  attr_reader :url

  def initialize(city)
    @city = city
    @url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{@city.coordinates}?exclude=daily,minutesly,hourly,alerts,flags"
  end

  def get_current
    get_json(nil,nil)[:currently]
  end

  def create_or_update
    current = CityCurrent.where(city_id: @city.id).first
    unless current.nil?
      update
    else
      create
    end
  end

  private

    def create
      data = get_current
      CityCurrent.create(city_id: @city.id,
        temp: data[:temperature],
        apparent: data[:apparentTemperature],
        icon: data[:icon],
        cloud_cover: data[:cloudCover],
        humidity: data[:humidity],
        visibility: data[:visibility],
        uv_index: data[:uvIndex],
        wind_speed: data[:windSpeed],
        wind_direction: data[:windBearing],
        summary: data[:summary])
    end

    def update
      current = @city.city_current
      data = get_current
      current.update(temp: data[:temperature],
      apparent: data[:apparentTemperature],
      icon: data[:icon],
      cloud_cover: data[:cloudCover],
      humidity: data[:humidity],
      visibility: data[:visibility],
      uv_index: data[:uvIndex],
      wind_speed: data[:windSpeed],
      wind_direction: data[:windBearing],
      summary: data[:summary])
    end
end
