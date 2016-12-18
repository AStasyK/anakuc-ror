class Image < ApplicationRecord
  #connections
  belongs_to :category
  has_one :game
  has_one :platform
  #validations
  validates_presence_of :file, :category_id
end
