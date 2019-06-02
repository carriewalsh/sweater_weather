class CityCurrent < ApplicationRecord
  validates_presence_of :temp,
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
