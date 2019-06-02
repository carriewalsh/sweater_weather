class ChangesLatLongBackToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :latitude
    add_column :cities, :latitude, :string
    remove_column :cities, :longitude
    add_column :cities, :longitude, :string
  end
end
