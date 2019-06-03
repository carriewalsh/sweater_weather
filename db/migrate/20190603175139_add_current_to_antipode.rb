class AddCurrentToAntipode < ActiveRecord::Migration[5.2]
  def change
    add_reference :antipodes, :city_current
  end
end
