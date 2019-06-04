require "rails_helper"

describe PhotoService, type: :service do
  describe "instance methods" do
    describe "get_photo" do
      it "gets park photo (hopefully) based on the city" do
        city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: 44.07, longitude: -123)
        photo_service = PhotoService.new(city)
        data = photo_service.get_json(nil,nil)[:photos][:photo].first
        result = photo_service.get_photo
        expect(result).to eq(data)
      end
    end
  end
end
