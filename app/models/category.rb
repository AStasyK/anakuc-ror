class Category < ApplicationRecord
  #connections
  has_many :games
  #validations
  validates_presence_of :name
end
