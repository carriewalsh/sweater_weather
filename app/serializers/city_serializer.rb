class CitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :state, :latitude, :longitude

  has_many :city_steadies
  has_many :city_days
  has_one :city_current
end