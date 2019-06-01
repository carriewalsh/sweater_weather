class City < ApplicationRecord
  validates_presence_of :name, :state, :latitude, :longitude

  has_many :city_days
  has_many :city_steadies
  has_one :city_current
end
