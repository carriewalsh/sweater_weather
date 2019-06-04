class ChangeColumnOwnerToIdPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :owner
    add_column :photos, :photo_id, :string
  end
end
