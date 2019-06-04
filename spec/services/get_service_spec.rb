require "rails_helper"

describe "GetService", type: :module do
  describe "Instance methods" do
    before :each do
      @city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: "44.07", longitude: "-123")
      @steady_service = SteadyService.new(@city)
      @city_day_service = CityDayService.new(@city)
      @current_service = CurrentService.new(@city)
    end

    describe "conn and get_json" do
      it "should successfully send a get request with a given url and parse it" do
        astronomy_body = @steady_service.get_json(nil,nil)
        forecast_body = @city_day_service.get_json(nil,nil)
        current_body = @current_service.get_json(nil,nil)

        astronomy_expected = astronomy_body[:astronomy][:astronomy].first
        expect(astronomy_expected).to be_a(Hash)
        expect(astronomy_expected.include?(:sunrise)).to be true
        expect(astronomy_expected.include?(:moonPhase)).to be true

        forecast_expected = forecast_body[:daily][:data].first
        expect(forecast_expected).to be_a(Hash)
        expect(forecast_expected.include?(:summary))

        current_expected = current_body[:currently]
        expect(current_expected).to be_a(Hash)
        expect(current_expected.include?(:summary)).to be true
        expect(current_expected.include?(:temperature)).to be true
      end
    end
  end
end
