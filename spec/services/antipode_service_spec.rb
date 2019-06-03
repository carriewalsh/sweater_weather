require "rails_helper"

describe AntipodeService, type: :service do
  describe "instance methods" do
    describe "get_antipode" do
      it "gets the antipode location and creates a city" do
        input = "hongkong"

        AntipodeService.new(input).get_antipode
        expect(City.count).to eq(2)
        expect(City.last.name).to eq("Jujuy")
        expect(City.last.country).to eq("Argentina")
      end
    end
  end
end
