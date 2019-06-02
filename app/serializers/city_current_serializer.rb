class CityCurrentSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :temp,
              :apparent,
              :icon,
              :cloud_cover,
              :humidity,
              :visibility,
              :uv_index,
              :wind_speed,
              :wind_direction,
              :summary

  belongs_to :city
end
