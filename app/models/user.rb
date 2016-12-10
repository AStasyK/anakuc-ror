class User < ApplicationRecord
  has_many :relationships
  has_many :followers, through: :relationships, foreign_key: "follower_id"
  has_many :favourites
  has_many :categories, through: :favourites
end
