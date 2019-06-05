require "rails_helper"

describe CityCreatorService, type: :service do
  describe "Instance methods" do
    describe "create_city" do
      it "creates a city and state for latitude/longitude given" do
        input = "Salem Oregon"
        coordinates = LatLongService.new(input).combine
        expect(City.count).to eq(0)
        expect(Photo.count).to eq(0)
        city_creator_service = CityCreatorService.new(input)
        city_creator_service.find_or_create
        expect(City.first.name).to eq("Salem")
        expect(City.first.state).to eq("Oregon")
        expect(City.first.latitude).to eq(coordinates.split(",")[0])
        expect(City.first.longitude).to eq(coordinates.split(",")[1])

        new_input = "Salem, OR"
        new_city_creator_service = CityCreatorService.new(new_input)
        new_city_creator_service.find_or_create
        expect(City.count).to eq(1)
        expect(City.first.name).to eq("Salem")
        expect(City.first.state).to eq("Oregon")
        expect(Photo.count).to eq(1)
      end
    end
  end
end
