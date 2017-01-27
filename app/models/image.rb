class Image < ApplicationRecord
  #connections
  belongs_to :category
  has_one :game
  has_one :platform
  has_many :values
  has_many :favourites
  has_many :users, through: :favourites
  #validations
  validates_presence_of :file, :category_id

end
