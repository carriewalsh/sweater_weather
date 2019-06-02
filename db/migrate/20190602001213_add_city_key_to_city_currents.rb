class AddCityKeyToCityCurrents < ActiveRecord::Migration[5.2]
  def change
    add_reference :city_currents, :city
  end
end
