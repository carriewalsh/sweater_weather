class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :search_location

  belongs_to :city, include: [:city_current]
end
