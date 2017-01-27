class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.integer :value
      t.integer :user_id, index: true
      t.integer :image_id, index: true

      t.timestamps

      add_index :user_rate, [:image_id, :user_id], unique: true
    end
  end
end
