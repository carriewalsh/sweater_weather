require "rails_helper"

describe "As a visitor" do
  describe "when I enter information" do
    it "creates an account in the db for me" do
      expect(User.count).to eq(0)
      post '/api/v1/users'
      expect(User.count).to eq(1)
    end
  end
end
