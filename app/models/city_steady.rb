class CitySteady < ApplicationRecord
  belongs_to :city
  belongs_to :day

  validates_presence_of :sunrise,
                        :sunset,
                        :moon_phase,
                        :phase_description,
                        :phase_icon
end
