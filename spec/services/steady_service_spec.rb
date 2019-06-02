require "rails_helper"

describe SteadyService, type: :service do
  before :each do
    @city = City.create(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123, photo_url: "a url")
    @steady_service = SteadyService.new(@city)
    url = "https://weather.cit.api.here.com/weather/1.0/report.json?name=salem oregon&app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg&product=forecast_astronomy"
    actual = Faraday.get(url)
    @body = JSON.parse(actual.body, symbolize_names: true)[:astronomy][:astronomy]
  end
  
  describe 'Instance methods' do
    describe "get_astros" do
      it 'gets weekly sunrise, sunset, moon data' do
        result = @steady_service.get_astros
        expect(result.class).to eq(Array)
        expect(result.first.class).to eq(Hash)
        expect(result.first[:sunrise]).to eq(@body.first[:sunrise])
        expect(result.first[:sunset]).to eq(@body.first[:sunset])
        expect(result.first[:moonPhase]).to eq(@body.first[:moonPhase])
        expect(result.first[:moonPhaseDesc]).to eq(@body.first[:moonPhaseDesc])
        expect(result.first[:iconName]).to eq(@body.first[:iconName])
      end
    end

    describe "create_or_update" do
      it "creates city_steadies in db" do
        today = Date.today
        count = 0
        while count < 7
          day = (today + count.days)
          Day.create(name: day.strftime("%B"), abbreviation: day.strftime("%b"), date: day)
          count += 1
        end
        expect(CitySteady.count).to eq(0)

        @steady_service.create_or_update
        expect(CitySteady.count).to eq(7)
        expect(CitySteady.first.sunrise).to eq(@body.first[:sunrise])
        expect(CitySteady.last.sunrise).to eq(@body.last[:sunrise])
      end

      it "creates city_steadies in db" do
        today = Date.today
        count = 0
        while count < 7
          day = (today + count.days)
          Day.create(name: day.strftime("%B"), abbreviation: day.strftime("%b"), date: day)
          CitySteady.create(city_id: @city.id, day_id: Day.find_by(date: day).id,
          sunrise: "1",
          sunset: "2",
          moon_phase: 3,
          phase_description: "blah",
          phase_icon: "blah")
          count += 1
        end
        expect(CitySteady.count).to eq(7)
        expect(CitySteady.first.sunrise).to eq("1")
        expect(CitySteady.last.sunrise).to eq("1")

        @steady_service.create_or_update
        expect(CitySteady.count).to eq(7)
        expect(CitySteady.first.sunrise).to eq(@body.first[:sunrise])
        expect(CitySteady.last.sunrise).to eq(@body[6][:sunrise])
      end
    end
  end
end