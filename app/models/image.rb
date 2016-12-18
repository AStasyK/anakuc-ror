class Image < ApplicationRecord
  #connections
  has_one :game
  has_one :platform
  #validations
  validates_presence_of :file
end
