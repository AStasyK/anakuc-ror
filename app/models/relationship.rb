class Relationship < ApplicationRecord
  #connections
  belongs_to :followed, class_name: 'User'
  belongs_to :follower, class_name: 'User'
  #validations
  validates_presence_of :followed_id, :follower_id
end