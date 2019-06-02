class CityCreatorService

  def initialize(input)
    @input = input
    @latlong = LatLongService.new(input).combine
  end

  def create_city
    city = get_json[:results].first[:address_components].fourth[:long_name]
    state = get_json[:results].first[:address_components][5][:long_name]
    if City.where(name: city, state: state).empty?
      City.create!(name: city, state: state, latitude: @latlong.split(",")[0], longitude: @latlong.split(",")[1], photo_url: "NOTHING RIGHT NOW")
    end

  end

  private

    def conn
      Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{@latlong}&key=#{ENV['GOOGLE_SECRET_KEY']}")
    end

    def get_json
      response = conn.body
      JSON.parse(response, symbolize_names: true)
    end
end
