require "rails_helper"

describe CityDayService, type: :service do
  before :each do
    @city = City.create(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123, photo_url: "a url")
    @city_day_service = CityDayService.new(@city)
    geo_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@city.name + ' ' + @city.state}n&key=#{ENV['GOOGLE_SECRET_KEY']}"
    actual_geo = Faraday.get(geo_url)
    geo_results = JSON.parse(actual_geo.body, symbolize_names: true)[:results].first[:geometry][:location]
    lat = geo_results[:lat]
    long = geo_results[:lng]

    weather_url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{lat},#{long}?exclude=currently,minutesly,hourly,alerts,flags&time=#{Time.now.to_f.round}"
    actual_weather = Faraday.get(weather_url)
    @body = JSON.parse(actual_weather.body, symbolize_names: true)[:daily][:data][0,7]
  end

  describe "instance methods" do
    describe "get_forecast" do
      it "gets forecast for the week" do
        result = @city_day_service.get_forecast
        expect(result.class).to eq(Array)
        expect(result.first.class).to eq(Hash)
        expect(result.first[:temperatureMin]).to eq(@body.first[:temperatureMin])
        expect(result.first[:temperatureMax]).to eq(@body.first[:temperatureMax])
        expect(result.first[:precipType]).to eq(@body.first[:precipType])
      end
    end


    describe "create_or_update" do
      xit "creates city_days if they don't exist" do

      end

      xit "updates city_days if they do exist" do

      end
    end
  end
end
