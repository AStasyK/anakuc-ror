class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :games_users, id: false do |t|
       t.integer :user_id, index: true
       t.integer :game_id, index: true
    end
  end
end
