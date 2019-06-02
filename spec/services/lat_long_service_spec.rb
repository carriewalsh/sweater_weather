require "rails_helper"

describe LatLongService, type: :service do
  before :each do
    @city = City.create(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123, photo_url: "a url")
    @lat_long_service = LatLongService.new(@city.name + ' ' + @city.state)
    data = @lat_long_service.get_json[:results].first[:geometry][:location]
    @lat = data[:lat]
    @long = data[:lng]
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
