class CreateAntipode < ActiveRecord::Migration[5.2]
  def change
    create_table :antipodes do |t|
      t.references :city, foreign_key: true
      t.string :search_location

      t.timestamps
    end
  end
end
