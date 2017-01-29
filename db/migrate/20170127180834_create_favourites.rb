class CreateFavourites < ActiveRecord::Migration[5.0]
  def change
    create_table :favourites do |t|
      t.integer :user_id, index: true
      t.integer :image_id, index: true

      t.timestamps

      #add_index :favourites, [:image_id, :user_id], unique: true
    end
  end
end
