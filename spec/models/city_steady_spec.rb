require 'rails_helper'

RSpec.describe CitySteady, type: :model do
  describe "Relationships" do
    it { should belong_to :city }
    it { should belong_to :day }
  end

  describe "Validations" do
    it { should validate_presence_of :sunrise }
    it { should validate_presence_of :sunset }
    it { should validate_presence_of :moon_phase }
    it { should validate_presence_of :phase_description }
    it { should validate_presence_of :phase_icon }
  end
end
