class Category < ApplicationRecord
  #connections
  has_many :games
  has_many :platforms
  has_many :images
  #validations
  validates_presence_of :name
end
