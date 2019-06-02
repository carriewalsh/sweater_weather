require "rails_helper"

describe CurrentService, type: :service do
  before :each do
    @city = City.create!(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123, photo_url: "a url")
    @current_service = CurrentService.new(@city)
    @lat_long_service = LatLongService.new(@city.name + ' ' + @city.state)
    coordinates = @lat_long_service.combine

    weather_url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{coordinates}?exclude=daily,minutesly,hourly,alerts,flags"
    actual_weather = Faraday.get(weather_url)
    @data = JSON.parse(actual_weather.body, symbolize_names: true)[:currently]
  end

  describe "Instance methods" do
    describe "get_current" do
      it "gets current weather data" do
        result = @current_service.get_current
        expect(result.class).to eq(Hash)
        expect(result[:temperature]).to eq(@data[:temperature])
        expect(result[:summary]).to eq(@data[:summary])
        expect(result[:cloudCover]).to eq(@data[:cloudCover])
      end
    end

    describe "create_or_update" do
      it "creates city_current if it doesn't exist" do
        expect(CityCurrent.count).to eq(0)
        @current_service.create_or_update

        expect(CityCurrent.first.temp.round(2)).to eq(@data[:temperature].round(2))
        expect(CityCurrent.first.summary).to eq(@data[:summary])
        expect(CityCurrent.first.cloud_cover.to_f).to eq(@data[:cloudCover])
      end

      it "updates city_current if it exists" do
        CityCurrent.create(city_id: @city.id,
                            temp: 1,
                            apparent: 2,
                            icon: "rain",
                            cloud_cover: 0.3,
                            humidity: 0.26,
                            visibility: 2,
                            uv_index: 1.2,
                            wind_speed: 2,
                            wind_direction: 123,
                            summary: "blah")
        expect(CityCurrent.count).to eq(1)
        expect(CityCurrent.first.temp.round(2)).to eq(1)
        expect(CityCurrent.first.uv_index).to eq(1.2)

        @current_service.create_or_update
        expect(CityCurrent.count).to eq(1)
        expect(CityCurrent.first.temp.round(2)).to eq(@data[:temperature].round(2))
        expect(CityCurrent.first.uv_index).to eq(@data[:uvIndex])
      end
    end
  end
end
