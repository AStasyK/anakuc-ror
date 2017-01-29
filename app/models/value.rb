class Value < ApplicationRecord
  #connections
  belongs_to :user
  belongs_to :image
  #validations
  validates_presence_of :user_id, :image_id, :value
  validates_uniqueness_of :user_id, scope: :image_id
end
