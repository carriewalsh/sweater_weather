class CityCurrentSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :city_id,
              :temp,
              :apparent,
              :icon,
              :cloud_cover,
              :humidity,
              :visibility,
              :uv_index,
              :wind_speed,
              :wind_direction,
              :summary

end
