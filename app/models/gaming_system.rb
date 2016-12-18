class GamingSystem < ApplicationRecord
  #connections
  belongs_to :game
  belongs_to :platform
  #validations
  validates_presence_of :game_id, :platform_id
end
