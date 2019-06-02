require 'rails_helper'

RSpec.describe CityDay, type: :model do
  describe "Relationships" do
    it { should belong_to :city }
    it { should belong_to :day }
  end

  describe "Validations" do
    it { should validate_presence_of :high }
    it { should validate_presence_of :low }
    it { should validate_presence_of :icon }
    it { should validate_presence_of :precip_probability }
    it { should validate_presence_of :summary }
  end
end
