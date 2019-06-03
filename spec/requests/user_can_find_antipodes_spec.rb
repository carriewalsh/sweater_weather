require "rails_helper"

describe "As a visitor", type: :request do
  describe "When I enter a city" do
    it "should return my weather and the weather of my antipode" do
      city = CityCreatorService.new("Hong Kong").find_or_create_city
      lat = city.latitude
      long = city.longitude

      conn = Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{lat}&long=#{long}") do |f|
        f.headers["api_key"] = ENV["AMY_KEY"]
        f.adapter Faraday.default_adapter
      end
      body = conn.get.body
      data = JSON.parse(body, symbolize_names: true)[:data]

      expect(data[:type]).to eq("antipode")
      expect(data[:attributes].keys.include?(:lat)).to be true
      expect(data[:attributes].keys.include?(:long)).to be true

    end
  end
end
