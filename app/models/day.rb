class Day < ApplicationRecord
  validates_presence_of :name, :abbreviation, :date
  has_many :city_days
end
