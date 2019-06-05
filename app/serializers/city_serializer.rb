class CitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :state, :latitude, :longitude, :country

  has_many :city_steadies
  has_many :city_days
  has_one :city_current
  has_one :photo
end
