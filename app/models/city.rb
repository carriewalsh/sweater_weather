class City < ApplicationRecord
  validates_presence_of :name, :country, :latitude, :longitude

  has_many :city_days
  has_many :city_steadies
  has_many :user_cities
  has_many :users, through: :user_cities
  has_one :city_current
  has_one :photo
  has_one :antipode

  def coordinates
    latitude + ',' + longitude
  end

  def name_string
    name + ', ' + state
  end

  def add_photo
    data = PhotoService.new(self).get_photo
    if data
      Photo.create( city_id: self.id,
        photo_id: data[:id],
        secret: data[:secret],
        server: data[:server],
        title: data[:title],
        farm: data[:farm],
        url: "https://farm#{data[:farm]}.staticflickr.com/#{data[:server]}/#{data[:id]}_#{data[:secret]}.jpg")
    else
      Photo.create( city_id: self.id,
        photo_id: "no photo",
        secret: "no photo",
        server: "no photo",
        title: "no photo",
        farm: "no photo",
        url: "http://unisci24.com/data_images/wlls/53/355489-vague.jpg")
    end
  end
end
