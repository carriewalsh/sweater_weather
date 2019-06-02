class CitySteadySerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :city_id,
              :day_id,
              :sunrise,
              :sunset,
              :moon_phase,
              :phase_description,
              :phase_icon
end
