require "rails_helper"

describe UserCity, type: :model do
  describe "Relationships" do
    it { should belong_to :city }
    it { should belong_to :user }
    it { should belong_to :city_current }
  end
end
