require "rails_helper"

describe Antipode, type: :model do
  describe "Relationships" do
    it { belong_to :city }
    it { belong_to :city_current }
  end
end
