class ChangeColumnOwnerToIdPhotos < ActiveRecord::Migration[5.2]
  def change
    change_column :photos, :owner, :photo_id
  end
end
