class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :image
  validates_presence_of :user_id, :image_id
end
