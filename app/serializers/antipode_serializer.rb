class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :search_city

  belongs_to :city, include: [:city_current]
end
