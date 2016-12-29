class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name, limit: 100
      t.integer :image_id, index: true
      t.string :genre, limit: 50
      t.integer :year
      t.string :company, limit: 50
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end
