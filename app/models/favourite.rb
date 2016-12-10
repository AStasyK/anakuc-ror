class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :platform
  belongs_to :game
end
