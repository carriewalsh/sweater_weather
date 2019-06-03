require "rails_helper"

describe "As a visitor", type: :request do
  describe "When I enter a city" do
    it "should return my weather and the weather of my antipode" do
      city = CityCreatorService.new("rio de janero").find_or_create_city
      city2 = CityCreatorService.new("Paris, France").find_or_create_city
      city1 = CityCreatorService.new("Buenos Aires Argentina").find_or_create_city
      lat = city.latitude
      long = city.longitude
      binding.pry

      Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82")
    end
  end
end
