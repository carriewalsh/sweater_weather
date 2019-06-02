class AddLatLongIndexesToCity < ActiveRecord::Migration[5.2]
  def change
    add_index :cities, :latitude
    add_index :cities, :longitude
  end
end
