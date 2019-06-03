class AntipodeService
  include GetService
  attr_reader :url

  def initialize(input)
    @input = input
    city = CityCreatorService.new(input).find_or_create_city
    lat = city.latitude
    long = city.longitude
    @url = "http://amypode.herokuapp.com/api/v1/antipodes?lat=#{lat}&long=#{long}"
  end

  def create_or_find_antipode
    data = get_antipode
    latlong = "#{data[:lat]},#{data[:long]}"
    CityCreatorService.new(latlong).find_or_create_city
  end

  private

    def get_antipode
      get_json_headers("api_key", ENV["AMY_KEY"])[:data]
    end
end