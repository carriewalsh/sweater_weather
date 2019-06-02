require "rails_helper"

describe "As a user" do
  describe "When I visit the forecast page" do
    describe "and enter a location" do
      it "returns lots of fun weather information for a location" do
        expect(City.count).to eq(0)
        get "/api/v1/forecast?location=#{"Salem Oregon"}"
        expect(response).to be_successful
        expect(City.count).to eq(1)
        expect(City.first.name).to eq("Salem")
        expect(City.first.state).to eq("Oregon")
      end
    end
  end
end
