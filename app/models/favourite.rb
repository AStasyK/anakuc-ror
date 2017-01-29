class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :image
  validates_presence_of :user_id, :image_id
  validates_uniqueness_of :user_id, scope: :image_id
end
