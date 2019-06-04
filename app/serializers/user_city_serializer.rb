class UserCitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

  belongs_to :city
  belongs_to :city_current
end
