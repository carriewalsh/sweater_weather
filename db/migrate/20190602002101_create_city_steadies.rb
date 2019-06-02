class CreateCitySteadies < ActiveRecord::Migration[5.2]
  def change
    create_table :city_steadies do |t|
      t.references :city, foreign_key: true
      t.references :day, foreign_key: true
      t.datetime :sunset
      t.datetime :sunrise
      t.decimal :moon_phase
      t.string :phase_description
      t.string :phase_icon

      t.timestamps
    end
  end
end
