class Game < ApplicationRecord
  #connections
  belongs_to :category
  has_many :gaming_systems
  has_many :platforms, through: :gaming_systems
  has_and_belongs_to_many :users
  belongs_to :image
  #validations
  validates_presence_of :name, :category_id, :image_id, :genre
end
