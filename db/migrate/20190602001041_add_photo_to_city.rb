class AddPhotoToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :photo_url, :string
  end
end
