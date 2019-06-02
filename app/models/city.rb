class City < ApplicationRecord
  validates_presence_of :name, :state, :latitude, :longitude

  has_many :city_days
  has_many :city_steadies
  has_one :city_current
  has_one :photo

  def coordinates
    latitude + ',' + longitude
  end

  def name_string
    name + ', ' + state
  end

  def add_photo
    data = FlickrService.new(self).get_photo
    Photo.create(city_id: self.id, owner: data[:owner], secret: data[:secret], server: data[:server], title: data[:title])
  end
end
