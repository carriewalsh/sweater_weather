require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Relationships" do
    it { should have_many :user_cities }
    it { should have_many :cities }
  end

  describe "Validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end
end
