require "rails_helper"

describe "As a visitor", type: :request do
  describe "When I enter a city" do
    it "should return my weather and the weather of my antipode" do
      get "/api/v1/antipode?loc=hongkong"

      # expect(response).to be successful
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data][:type]).to eq("antipode")
      expect(body[:data][:attributes].include?(:search_location)).to be true
      expect(body[:included].second[:type]).to eq("city_current")
      expect(body[:included].second[:attributes].include?(:temp)).to be true
    end

    it "returns a message if antipode cannot be found" do
      get "/api/v1/antipode?loc=salem,oregon"
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:message]).to eq("Antipode cannot be found")
    end
  end

  describe "amypode" do
    it "returns the lat and long of the antipode" do
      city = CityCreatorService.new("hongkong").find_or_create
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
