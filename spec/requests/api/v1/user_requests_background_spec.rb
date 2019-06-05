require "rails_helper"

describe "As a user" do
  describe "When I visit the background page" do
    describe "and enter a location" do
      it "returns a background for a location" do
        expect(City.count).to eq(0)
        expect(Photo.count).to eq(0)
        get "/api/v1/backgrounds?location=#{"Salem Oregon"}"
        expect(response).to be_successful
        expect(City.count).to eq(1)
        expect(Photo.count).to eq(1)
        expect(City.first.photo).to_not eq(nil)
      end
    end
  end
end
