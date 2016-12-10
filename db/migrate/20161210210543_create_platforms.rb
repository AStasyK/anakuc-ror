class CreatePlatforms < ActiveRecord::Migration[5.0]
  def change
    create_table :platforms do |t|
      t.string :family, limit: 50
      t.string :name, limit: 50
      t.integer :year
      t.integer :category_id

      t.timestamps
    end
  end
end
