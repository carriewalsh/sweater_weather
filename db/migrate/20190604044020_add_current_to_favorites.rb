class AddCurrentToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_cities, :city_current
  end
end
