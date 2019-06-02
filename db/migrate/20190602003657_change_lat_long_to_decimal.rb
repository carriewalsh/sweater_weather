class ChangeLatLongToDecimal < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :latitude
    add_column :cities, :latitude, :decimal
    remove_column :cities, :longitude
    add_column :cities, :longitude, :decimal
  end
end
