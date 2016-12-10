json.extract! game, :id, :name, :category_id, :genre, :year, :company, :created_at, :updated_at
json.url game_url(game, format: :json)