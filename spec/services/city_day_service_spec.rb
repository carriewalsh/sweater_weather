require "rails_helper"

describe CityDayService, type: :service do
  before :each do
    @city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: 44.07, longitude: -123)
    @city_day_service = CityDayService.new(@city)

    @data = @city_day_service.get_json[:daily][:data][1,7]
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
        while count < 14
          day = (today + count.days)
          Day.create(name: day.strftime("%A"), abbreviation: day.strftime("%a"), date: day)
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
        while count < 14
          day = (today + count.days)
          Day.create(name: day.strftime("%A"), abbreviation: day.strftime("%a"), date: day)
          CityDay.create(city_id: @city.id, day_id: Day.find_by(date: day).id,
          high: 13,
          low: 2.2,
          icon: 3,
          precip_probability: 0.3,
          summary: "blah")
          count += 1
        end
        expect(CityDay.count).to eq(14)
        expect(CityDay.first.low).to eq(2.2)
        expect(CityDay.last.low).to eq(2.2)
        CityDayService.new(@city).create_or_update

        expect(CityDay.count).to eq(14)
        expect(CityDay.fifth.summary).to_not eq("blah")
      end
    end
  end
end
