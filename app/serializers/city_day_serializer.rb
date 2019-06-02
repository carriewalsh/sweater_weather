class CityDaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :high, :low, :icon, :precip_probability, :summary

  belongs_to :city
  belongs_to :day
end
