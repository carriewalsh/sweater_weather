require "rails_helper"

describe CityCurrent, type: :model do
  describe "Relationships" do
    it { should belong_to :city }
    it { should have_one :antipode }
  end

  describe "Validations" do
    it { should validate_presence_of :temp }
    it { should validate_presence_of :apparent }
    it { should validate_presence_of :icon }
    it { should validate_presence_of :cloud_cover }
    it { should validate_presence_of :humidity }
    it { should validate_presence_of :visibility }
    it { should validate_presence_of :uv_index }
    it { should validate_presence_of :wind_speed }
    it { should validate_presence_of :wind_direction }
    it { should validate_presence_of :summary }
  end
end
