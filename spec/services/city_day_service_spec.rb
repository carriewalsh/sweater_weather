require "rails_helper"

describe CityDayService, type: :service do
  before :each do
    @city = City.create(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123, photo_url: "a url")
    @city_day_service = CityDayService.new(@city)
    geo_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@city.name + ' ' + @city.state}n&key=#{ENV['GOOGLE_SECRET_KEY']}"
    geo_results = JSON.parse(actual.body, symbolize_names: true)[:results][:geometry][:location]
    lat = geo_results[:lat]
    long = geo_results[:lng]

    weather_url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{lat},#{long}"
    binding.pry
    actual = Faraday.get(url)
    @body = JSON.parse(actual.body, symbolize_names: true)[:astronomy][:astronomy]
    ENV['DARK_SKY_SECRET_KEY']
  end

  describe "instance methods" do
    describe "get_forecast" do
      it "gets forecast for the week" do

      end
    end


    describe "create_or_update" do
      it "creates city_days if they don't exist" do

      end

      it "updates city_days if they do exist" do

      end
    end
  end
end
