class CitySteadySerializer
  include FastJsonapi::ObjectSerializer
  attributes  :sunrise,
              :sunset,
              :moon_phase,
              :phase_description,
              :phase_icon

  belongs_to :city
  belongs_to :day
end
