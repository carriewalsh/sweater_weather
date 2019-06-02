require "rails_helper"

describe "As a user" do
  describe "When I visit the forecast page" do
    describe "and enter a location" do
      it "returns lots of fun weather information for a location" do
        expect(City.count).to eq(0)
        get "/api/v1/forecast?location=#{"Salem, Oregon"}"
        expect(response).to be_successful
        forecast = JSON.parse(response.body)
        expect(City.count).to eq(1)
      end
    end
  end
end
