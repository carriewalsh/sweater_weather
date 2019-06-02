require "rails_helper"

describe FlickrService, type: :service do
  describe "instance methods" do
    describe "get_photo" do
      it "gets park photo (hopefully) based on the city" do
        city = City.create(name: "Salem", state: "Oregon", latitude: 44.07, longitude: -123)
        flickr_service = FlickrService.new(city)
        data = flickr_service.get_json[:photos][:photo].first
        result = flickr_service.get_photo
        expect(result).to eq(data)
      end
    end
  end
end
