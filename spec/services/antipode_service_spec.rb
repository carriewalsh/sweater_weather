require "rails_helper"

describe AntipodeService, type: :service do
  describe "instance methods" do
    describe "get_antipode" do
      it "gets the antipode lat/long" do
        input = "hongkong"

        data = AntipodeService.new(input).get_antipode
        expect(data[:type]).to eq("antipode")
        expect(data[:attributes].keys.include?(:lat)).to be true
        expect(data[:attributes].keys.include?(:long)).to be true
      end
    end

    describe "create_or_find_antipode" do
      AntipodeService.new("hongkong").create_or_find_antipode
      expect(City.count).to eq(2)
      expect(City.last.name).to eq("Jujuy")
      expect(City.last.country).to eq("Argentina")
    end
  end
end
