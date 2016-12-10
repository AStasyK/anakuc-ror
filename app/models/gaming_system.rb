class GamingSystem < ApplicationRecord
  belongs_to :game
  belongs_to :platform
end
