require "rails_helper"

describe City, type: :model do
  describe "Relationships" do
    it { should have_many :city_days }
    it { should have_many :city_steadies }
    it { should have_one :city_current }
    it { should have_one :photo }
    it { should have_one :antipode }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :country }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
  end

  describe "Instance methods" do
    before :each do
      @city = City.create(name: "Salem", state: "Oregon", country: "United States", latitude: "44.07", longitude: "-123")
    end

    describe "coordinates" do
      it "should return a string of both lat/long coordinates" do
        result = @city.coordinates
        expect(result).to eq("44.07,-123")
      end
    end

    describe "name_string" do
      it "should return a string of the city and state" do
        result = @city.name_string
        expect(result).to eq("Salem, Oregon")
      end
    end

    describe "add_photo" do
      it "should add a photo relationship for city" do
        expect(@city.photo).to eq(nil)
        @city.add_photo
        expect(City.first.photo).to_not eq(nil)
      end
      it "returns default photo for city that doesn't return any photo" do
        city = City.create(name: "s;difjados;ifjados;fjasdgo;iawetg", state: ";asdoifuaw;ebietjbasd;if", country: "awe'tpihaw4;ogeifuvah;sietuhabwet", latitude: "44.07", longitude: "-123")
        result = city.add_photo
        expect(result.url).to eq("http://unisci24.com/data_images/wlls/53/355489-vague.jpg")
      end
    end
  end
end
