class City < ApplicationRecord
  validates_presence_of :name, :state, :latitude, :longitude, :photo_url

  has_many :city_days
  has_many :city_steadies
  has_one :city_current

  def coordinates
    latitude + ',' + longitude
  end

  def name_string
    name + ', ' + state
  end
end
