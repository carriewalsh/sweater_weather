require "rails_helper"

describe "As a user" do
  describe "when I enter email/password" do
    xit "creates a new session" do
      User.create(email: "example@gob.com", password: "password")
      expect(User.count).to eq(1)
      
      post('/api/v1/sessions?email=example@gob.com&password=password')

      expect(response.status).to eq(201)
    end
  end
end
