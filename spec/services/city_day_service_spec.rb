require "rails_helper"

describe CityDayService, type: :service do
  before :each do
    @city = City.create(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123, photo_url: "a url")
    @city_day_service = SteadyService.new(@city)
    url = "https://weather.cit.api.here.com/weather/1.0/report.json?name=salem oregon&app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg&product=forecast_astronomy"
    actual = Faraday.get(url)
    @body = JSON.parse(actual.body, symbolize_names: true)[:astronomy][:astronomy]
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
