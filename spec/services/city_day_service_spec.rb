require "rails_helper"

describe CityDayService, type: :service do
  before :each do
    @city = City.create(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123, photo_url: "a url")
    @city_day_service = CityDayService.new(@city)

    @lat_long_service = LatLongService.new(@city.name + ' ' + @city.state)
    coordinates = @lat_long_service.combine

    weather_url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{coordinates}?exclude=currently,minutesly,hourly,alerts,flags&time=#{Time.now.to_f.round}"
    actual_weather = Faraday.get(weather_url)
    @data = JSON.parse(actual_weather.body, symbolize_names: true)[:daily][:data][0,7]
  end

  describe "instance methods" do
    describe "get_forecast" do
      it "gets forecast for the week" do
        result = @city_day_service.get_forecast
        expect(result.class).to eq(Array)
        expect(result.first.class).to eq(Hash)
        expect(result.first[:temperatureMin]).to eq(@data.first[:temperatureMin])
        expect(result.first[:temperatureMax]).to eq(@data.first[:temperatureMax])
        expect(result.first[:precipType]).to eq(@data.first[:precipType])
      end
    end


    describe "create_or_update" do
      it "creates city_days if they don't exist" do
        today = Date.today
        count = 0
        while count < 7
          day = (today + count.days)
          Day.create(name: day.strftime("%B"), abbreviation: day.strftime("%b"), date: day)
          count += 1
        end
        expect(CityDay.count).to eq(0)

        @city_day_service.create_or_update
        expect(CityDay.count).to eq(7)
        expect(CityDay.first.low).to eq(@data.first[:temperatureMin])
        expect(CityDay.last.low).to eq(@data.last[:temperatureMin])
      end

      it "updates city_days if they do exist" do
        today = Date.today
        count = 0
        while count < 7
          day = (today + count.days)
          Day.create(name: day.strftime("%B"), abbreviation: day.strftime("%b"), date: day)
          CityDay.create(city_id: @city.id, day_id: Day.find_by(date: day).id,
          high: 13,
          low: 2.2,
          icon: 3,
          precip_probability: 0.3,
          summary: "blah")
          count += 1
        end
        expect(CityDay.count).to eq(7)
        expect(CityDay.first.low).to eq(2.2)
        expect(CityDay.last.low).to eq(2.2)

        @city_day_service.create_or_update
        expect(CityDay.count).to eq(7)
        expect(CityDay.first.low).to eq(@data.first[:temperatureMin])
        expect(CityDay.last.low).to eq(@data[6][:temperatureMin])
      end
    end
  end
end
