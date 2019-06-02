class RemovePhotoColumnFromCity < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :photo_url
  end
end
