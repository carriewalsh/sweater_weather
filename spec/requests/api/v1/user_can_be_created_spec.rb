require "rails_helper"

describe "As a visitor" do
  describe "when I enter information" do
    it "creates an account in the db for me" do
      expect(User.count).to eq(0)

      post "/api/v1/users?email=example@gob.com&password=password&password_confirmation=password"
      expect(User.count).to eq(1)
      expect(response.status).to eq(201)
    end

    it "does not create an account if I already have one" do
      User.create(email: "example@gob.com", password: "password")
      expect(User.count).to eq(1)
      post "/api/v1/users?email=example@gob.com&password=password&password_confirmation=password"
      expect(User.count).to eq(1)
      expect(response.status).to eq(409)
    end

    it "throws an error if password confirmation is wrong" do
      post "/api/v1/users?email=example@gob.com&pasdfsadfsword_confirmation=password"
      expect(response.status).to eq(400)
    end
  end
end
