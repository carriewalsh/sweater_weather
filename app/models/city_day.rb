class CityDay < ApplicationRecord
  validates_presence_of :high, :low, :icon, :precip_probability, :summary

  belongs_to :city
  belongs_to :day
end
