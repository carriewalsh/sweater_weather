require "rails_helper"

describe "As a user" do
  describe "when I enter email/password" do
    it "creates a new session" do
      User.create(email: "example@gob.com", password: "password", api_key: "asdf")
      expect(User.count).to eq(1)

      post('/api/v1/sessions?user[email]=example@gob.com&user[password]=password')

      expect(response.status).to eq(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:api_key]).to eq("asdf")
    end

    it "does not allow me to log in with the wrong password" do
      User.create(email: "example@gob.com", password: "password", api_key: "asdf")
      expect(User.count).to eq(1)

      post('/api/v1/sessions?user[email]=example@gob.com&user[password]=not')

      expect(response.status).to eq(403)
    end

    it "does not allow me to log in if I don't exist" do
      post('/api/v1/sessions?user[email]=example@gob.com&user[password]=not')

      expect(response.status).to eq(403)
    end
  end
end
