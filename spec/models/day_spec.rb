require 'rails_helper'

RSpec.describe Day, type: :model do
  describe "Relationships" do
    it { should have_many :city_days }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :abbreviation }
    it { should validate_presence_of :date }
  end
end
