class CreateGamingSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :gaming_systems do |t|
      t.integer :game_id
      t.integer :platform_id

      t.timestamps
    end
  end
end
