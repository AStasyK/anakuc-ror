class AddColumnImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :category_id, :integer
  end
end
