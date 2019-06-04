class AddFarmAndUrlColumnToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :farm, :string
    add_column :photos, :url, :string
  end
end
