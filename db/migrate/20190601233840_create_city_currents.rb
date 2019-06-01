class CreateCityCurrents < ActiveRecord::Migration[5.2]
  def change
    create_table :city_currents do |t|
      t.decimal :temp
      t.decimal :apparent
      t.string :icon
      t.decimal :cloud_cover
      t.decimal :humidity
      t.decimal :visibility
      t.decimal :uv_index
      t.decimal :wind_speed
      t.decimal :wind_direction

      t.timestamps
    end
  end
end
