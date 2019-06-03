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

  def get_antipode
    get_json_headers("api_key", ENV["AMY_KEY"])
    binding.pry
  end
end
