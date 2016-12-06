class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password, limit: 32
      t.string :password_confirm, limit: 32

      t.timestamps
    end
  end
end
