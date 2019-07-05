require "rails_helper"

describe "As a visitor" do
  describe "when I visit '/'" do
    it "shows me a readme with documentation and links" do
      get "/"
      json = JSON.parse(response.body)
      expect(response).to be_successful
      # expect(page).to have_content("github_site")
      # expect(page).to have_link("https://github.com/carriewalsh/sweater_weather")
      # expect(page).to have_content("Endpoints")
      # expect(page).to have_content("GET '/api/v1/forecasts'")

    end
  end

  describe "when I visit '/api/v1'" do
    it "shows me a readme with documentation and links" do
      get "/api/v1"
      expect(response).to be_successful
      # expect(page).to have_content("Github")
      # expect(page).to have_link("https://github.com/carriewalsh/sweater_weather")
      # expect(page).to have_content("Endpoints")
      # expect(page).to have_content("GET '/api/v1/forecasts'")
    end
  end
end
