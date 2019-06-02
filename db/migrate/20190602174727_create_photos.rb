class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :city, foreign_key: true
      t.string :owner
      t.string :secret
      t.string :server
      t.string :title
    end
  end
end
