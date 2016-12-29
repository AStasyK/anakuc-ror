class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.integer :value
      t.integer :user_id, index: true
      t.integer :image_id, index: true

      t.timestamps
    end
  end
end
