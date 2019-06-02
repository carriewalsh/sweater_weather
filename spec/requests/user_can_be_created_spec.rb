require "rails_helper"

describe "As a visitor" do
  describe "when I enter information" do
    it "creates an account in the db for me" do
      expect(User.count).to eq(0)
      request = Faraday.new('/api/v1/users') do |f|
        f.params["email"] = "example@gob.com"
        f.params["password"] = "password"
        f.params["password_confirmation"] = "password"
        f.adapter Faraday.default_adapter
      end
      request.post

      expect(User.count).to eq(1)
    end
  end
end
