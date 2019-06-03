require "rails_helper"

describe Antipode, type: :model do
  describe "Relationships" do
    it { belongs_to :city }
  end
end
