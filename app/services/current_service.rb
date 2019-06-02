class CurrentService

  def initialize(city)
    @city = city
  end

  def get_current
    get_json[:currently]
  end

  def create_or_update
    current = CityCurrent.where(city_id: @city.id)
    unless current.empty?
      update
    else
      create
    end
  end

  private

    def conn
      coordinates = LatLongService.new(@city.name + ' ' + @city.state).combine
      Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{coordinates}?exclude=daily,minutesly,hourly,alerts,flags")
    end

    def get_json
      response = conn.body
      JSON.parse(response, symbolize_names: true)
    end

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
