class UpdateFavourites < ActiveRecord::Migration[5.0]
  def change
    remove_column :favourites, :category_id
    add_column :favourites, :game_id, :integer
    remove_column :favourites, :platform_id
  end
end
