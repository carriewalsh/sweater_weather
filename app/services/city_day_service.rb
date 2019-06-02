class CityDayService

  def initialize(city)
    @city = city
  end

  def get_forecast
    get_json[:daily][:data][0,7]
  end


  private

    def conn
      coordinates = LatLongService.new(@city).combine
      Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{coordinates}?exclude=currently,minutesly,hourly,alerts,flags&time=#{Time.now.to_f.round}")
    end

    def get_json
      response = conn.body
      JSON.parse(response, symbolize_names: true)
    end
end
