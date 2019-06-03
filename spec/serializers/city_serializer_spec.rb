require "rails_helper"

describe CitySerializer, type: :serializer do
  describe "When a known city is entered" do
    it "returns all sorts of data" do
      today = Date.today
      count = 0
      while count < 7
        day = (today + count.days)
        Day.create(name: day.strftime("%A"), abbreviation: day.strftime("%a"), date: day)
        count += 1
      end
      city = City.create(name: "New York", state: "New York", latitude: "40.7127753", longitude: "-74.0059728")
      SteadyService.new(city).create_or_update
      CurrentService.new(city).create_or_update
      CityDayService.new(city).create_or_update
      serializer = CitySerializer.new(city, {
        include: [:city_steadies, :city_days, :city_current, :photo]
        })
        response = JSON.parse(serializer.to_json, symbolize_names: true)
        expect(response[:data][:attributes][:name]).to eq("New York")
        expect(response[:data][:relationships][:city_steadies][:data].count).to eq(7)
        expect(response[:data][:relationships][:city_days][:data].count).to eq(7)
        expect(response[:included].first[:type]).to eq("city_current")
    end
  end

  describe "When a new city is entered" do
    it "creates data and then returns it" do
      today = Date.today
      count = 0
      while count < 7
        day = (today + count.days)
        Day.create(name: day.strftime("%A"), abbreviation: day.strftime("%a"), date: day)
        count += 1
      end
      city = CityCreatorService.new("New York City New York").find_or_create_city
      serializer = CitySerializer.new(city, {
        include: [:city_steadies, :city_days, :city_current, :photo]
        })
        binding.pry
    end
  end
end
