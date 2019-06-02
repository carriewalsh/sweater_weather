require "rails_helper"

describe City, type: :model do
  describe "Relationships" do
    it { should have_many :city_days }
    it { should have_many :city_steadies }
    it { should have_one :city_current }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :state }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
  end
end
