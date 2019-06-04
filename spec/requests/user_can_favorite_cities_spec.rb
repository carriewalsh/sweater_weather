require "rails_helper"

describe "As a logged-in user" do
  describe "if I like cities" do
    it "I can add them to my favorites" do
      city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: "44.07", longitude: "-123")
      user = User.create(email: "example@gob.com", password: "password", api_key: "12345")
      CurrentService.new(city).create_or_update

      post("/api/v1/favorites?location=#{city.id}&api_key=12345")
      expect(UserCity.count).to eq(1)
      expect(response.status).to eq(200)
      expect(user.cities.count).to eq(1)
    end

    it "does not allow me to add favorites with the wrong api key" do
      city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: "44.07", longitude: "-123")
      user = User.create(email: "example@gob.com", password: "password", api_key: "12345")

      post("/api/v1/favorites?location=#{city.id}&api_key=67890")
      expect(UserCity.count).to eq(0)
      expect(response.status).to eq(401)
    end

    xit "lets me see my favorite cities" do
      city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: "44.07", longitude: "-123")
      user = User.create(email: "example@gob.com", password: "password", api_key: "12345")
      city_current = CurrentService.new(city).create_or_update
      UserCity.create!(user_id: user.id, city_id: city.id, city_current_id: city_current.id)
      get('/api/v1/favorites?api_key=12345')

      expect(response.status).to eq(200)
      data = JSON.parse(response.body).first
      expect(data[:location]).to eq("Salem, Oregon")
      # expect(data[:current]).to eq()
      expect(user.cities.count).to eq(1)
    end

    it "does not let me see my favorite cities without my api key" do
      city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: "44.07", longitude: "-123")
      user = User.create(email: "example@gob.com", password: "password", api_key: "12345")
      UserCity.create(user_id: user.id, city_id: city.id)

      get("/api/v1/favorites?api_key=67890")

      expect(response.status).to eq(401)
    end

    it "allows me to destroy a no-longer-favorite city" do
      city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: "44.07", longitude: "-123")
      user = User.create(email: "example@gob.com", password: "password", api_key: "12345")
      UserCity.create(user_id: user.id, city_id: city.id)

      delete("/api/v1/favorites?location=#{city.id}&api_key=12345")

      expect(response.status).to eq(200)
      expect(UserCity.count).to eq(0)
    end

    xit "doesn't allow me to destroy a no-longer-favorite city without my api key" do
      city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: "44.07", longitude: "-123")
      user = User.create(email: "example@gob.com", password: "password", api_key: "12345")
      UserCity.create(user_id: user.id, city_id: city.id)

      delete("/api/v1/favorites?location=#{city.id}&api_key=67890")

      expect(response.status).to eq(401)
      expect(UserCity.count).to eq(1)
    end
  end
end
