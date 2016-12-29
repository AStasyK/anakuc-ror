class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :file
      t.float :ave_value
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end
