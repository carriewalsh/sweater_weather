require "rails_helper"

describe "As a user" do
  describe "when I enter email/password" do
    it "creates a new session" do
      User.create(email: "example@gob.com", password: "password")
      expect(User.count).to eq(1)

      post('/api/v1/sessions?user[email]=example@gob.com&user[password]=password')

      expect(response.status).to eq(200)
    end
  end
end
