class CityDaySerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :city_id,
              :day_id,
              :high,
              :low,
              :icon,
              :precip_probability,
              :summary
end
