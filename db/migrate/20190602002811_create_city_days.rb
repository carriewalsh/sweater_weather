class CreateCityDays < ActiveRecord::Migration[5.2]
  def change
    create_table :city_days do |t|
      t.references :city, foreign_key: true
      t.references :day, foreign_key: true
      t.decimal :high
      t.decimal :low
      t.string :icon
      t.decimal :precip_probability
      t.text :summary

      t.timestamps
    end
  end
end
