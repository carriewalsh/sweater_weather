require "rails_helper"

describe Photo, type: :model do
  describe "Relationships" do
    it { should belong_to :city }
  end

  describe "Validations" do
    it { should validate_presence_of :owner }
    it { should validate_presence_of :secret }
    it { should validate_presence_of :server }
    it { should validate_presence_of :title }
    it { should validate_presence_of :farm }
    it { should validate_presence_of :url }
  end
end
