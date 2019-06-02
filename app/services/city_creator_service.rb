class CityCreatorService
  include GetService
  attr_reader :url

  def initialize(input)
    @input = input
    @latlong = LatLongService.new(input).combine
    @url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{@latlong}&key=#{ENV['GOOGLE_SECRET_KEY']}"
  end

  def find_or_create_city
    city = get_city
    state = get_state
    if City.where(name: city, state: state).empty?
      City.create!(name: city, state: state, latitude: @latlong.split(",")[0], longitude: @latlong.split(",")[1])
    else
      City.where(name: city, state: state)
    end
  end

  private

    def get_city
      data = get_json[:results].first[:address_components]
      city = nil
      data.map do |datum|
        if datum[:types].include?("locality")
          city = datum[:long_name]
        end
      end
      city
    end

    def get_state
      data = get_json[:results].first[:address_components]
      state = nil
      data.map do |datum|
        if datum[:types].include?("administrative_area_level_1")
          state = datum[:long_name]
        end
      end
      state
    end
end
