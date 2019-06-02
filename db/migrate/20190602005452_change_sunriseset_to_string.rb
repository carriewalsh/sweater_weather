class ChangeSunrisesetToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :city_steadies, :sunrise
    add_column :city_steadies, :sunrise, :string
    remove_column :city_steadies, :sunset
    add_column :city_steadies, :sunset, :string
  end
end
