require "rails_helper"

describe "As a user" do
  describe "When I visit the forecast page" do
    describe "and enter a location" do
      it "returns lots of fun weather information for a location" do
        today = Date.today
        count = 0
        while count < 7
          day = (today + count.days)
          Day.create(name: day.strftime("%A"), abbreviation: day.strftime("%a"), date: day)
          count += 1
        end

        expect(City.count).to eq(0)
        expect(CityCurrent.count).to eq(0)
        expect(CityDay.count).to eq(0)
        expect(CitySteady.count).to eq(0)
        get "/api/v1/forecast?location=#{"Salem Oregon"}"
        expect(response).to be_successful
        expect(City.count).to eq(1)
        expect(City.first.name).to eq("Salem")
        expect(City.first.state).to eq("Oregon")
        expect(CityCurrent.count).to eq(1)
        binding.pry
        expect(CityDay.count).to eq(7)
        expect(CitySteady.count).to eq(7)
      end
    end
  end
end
