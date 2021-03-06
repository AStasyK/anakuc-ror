class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :email, limit: 100
      t.string :password

      t.index :email, unique: true

      t.timestamps
    end
  end
end
