class Game < ApplicationRecord
  belongs_to :category
  has_many :gaming_systems
  has_many :platforms, through: :gaming_systems
  has_many :favourites
  has_many :users, through: :favourites
end
