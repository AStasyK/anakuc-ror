class Platform < ApplicationRecord
  #connections
  belongs_to :category
  has_many :gaming_systems
  has_many :games, through: :gaming_systems
  belongs_to :image
  #validations
  validates_presence_of :family, :category_id, :image_id
end
