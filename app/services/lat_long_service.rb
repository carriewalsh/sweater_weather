class LatLongService

  def initialize(city)
    @city = city
  end

  def get_lat_long
    get_json[:results].first[:geometry][:location]
  end

  def combine
    data = get_lat_long
    "#{data[:lat]},#{data[:lng]}"
  end


  private

    def conn
      place = @city.name + ' ' + @city.state
      Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{place}n&key=#{ENV['GOOGLE_SECRET_KEY']}")
    end

    def get_json
      response = conn.body
      JSON.parse(response, symbolize_names: true)
    end

end
