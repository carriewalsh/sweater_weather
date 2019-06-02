require "rails_helper"

describe SteadyService, type: :service do
  before :each do
    @city = City.new(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123)
    @steady_service = SteadyService.new(@city)
    url = "https://weather.cit.api.here.com/weather/1.0/report.json?name=salem oregon&app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg&product=forecast_astronomy"
    @actual = Faraday.get(url)
    Day.create(name: "Sunday", abbreviation: "Sun", date: Date.today)
    Day.create(name: "Monday", abbreviation: "Mon", date: Date.today)
    Day.create(name: "Tuesday", abbreviation: "Tue", date: Date.today)
    Day.create(name: "Wednesday", abbreviation: "Wed", date: Date.today)
    Day.create(name: "Thursday", abbreviation: "Thu", date: Date.today)
    Day.create(name: "Friday", abbreviation: "Fri", date: Date.today)
    Day.create(name: "Saturday", abbreviation: "Sat", date: Date.today)
  end
  describe 'Instance methods' do
    describe "get_astros" do
      it 'gets weekly sunrise, sunset, moon data' do
        result = @steady_service.get_astros
        expect(result.class).to eq(Hash)
        expect(result.sunrise.class).to eq(@actual["astronomy"]["astronomy"]["sunrise"])
        expect(result.sunset.class).to eq(@actual["astronomy"]["astronomy"]["sunset"])
        expect(result.moon_phase.class).to eq(@actual["astronomy"]["astronomy"]["moonPhase"])
        expect(result.phase_description.class).to eq(@actual["astronomy"]["astronomy"]["MoonPhaseDesc"])
        expect(result.phase_icon.class).to eq(@actual["astronomy"]["astronomy"]["iconName"])
      end
    end

    describe "create_or_update" do
      xit "creates or updates city_steadies in db" do
        @steady_service.create_or_update
        today =
        steadies = CitySteady.where(city_id: @city.id, day_id:)
        expect(CitySteady.count).to eq(7)
        expect()
        # this should create or update 7 city_steadies for that city and that week by calling get_astros on that city
      end
    end
  end
end
