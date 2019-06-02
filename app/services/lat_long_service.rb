class LatLongService
  include GetService
  attr_reader :url

  def initialize(input)
    @input = input
    @url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@input}n&key=#{ENV['GOOGLE_SECRET_KEY']}"
  end

  def get_lat_long
    get_json[:results].first[:geometry][:location]
  end

  def combine
    data = get_lat_long
    "#{data[:lat]},#{data[:lng]}"
  end
end
