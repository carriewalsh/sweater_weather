require "rails_helper"

describe AntipodeService, type: :service do
  describe "instance methods" do
    describe "create_or_find_city" do
      it "creates antipode city" do
        AntipodeService.new("hongkong").create_or_find_city
        expect(City.count).to eq(2)
        expect(City.last.name).to eq("Jujuy")
        expect(City.last.country).to eq("Argentina")
      end
    end

    describe "create_antipode" do
      it "creates antipode" do
        expect(Antipode.count).to eq(0)
        AntipodeService.new("hongkong").create_antipode
        expect(Antipode.count).to eq(1)
        jujuy = City.find_by(name: "Jujuy")
        expect(Antipode.first.city_id).to eq(jujuy.id)
        expect(Antipode.first.search_location).to eq("Hong Kong")
      end
    end
  end
end
