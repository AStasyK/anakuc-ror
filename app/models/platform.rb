class Platform < ApplicationRecord
  belongs_to :category
  has_many :gaming_systems
  has_many :games, through: :gaming_systems
end
