require "rails_helper"

describe LatLongService, type: :service do
  before :each do
    @city = City.create(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123, photo_url: "a url")
    @lat_long_service = LatLongService.new(@city)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@city.name + ' ' + @city.state}n&key=#{ENV['GOOGLE_SECRET_KEY']}"
    actual_geo = Faraday.get(url)
    results = JSON.parse(actual_geo.body, symbolize_names: true)[:results].first[:geometry][:location]
    @lat = results[:lat]
    @long = results[:lng]
  end

  describe "instance methods" do
    describe "get_lat_long" do
      it "gets the latitude and longitude for a location" do
        result = @lat_long_service.get_lat_long
        expect(result[:lat]).to eq(@lat)
        expect(result[:lng]).to eq(@long)
      end
    end

    describe "combine" do
      it "combines lat and long for DarkSky search" do
        result = @lat_long_service.combine
        expect(result).to eq("#{@lat},#{@long}")
      end
    end
  end

end
