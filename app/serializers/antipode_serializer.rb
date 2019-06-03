class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :search_location

  belongs_to :city
  belongs_to :city_current
end
