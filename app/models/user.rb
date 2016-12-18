class User < ApplicationRecord
  #connections
  has_many :relationships
  has_many :followers, through: :relationships, source: :user, foreign_key: :follower_id
  has_many :followeds, through: :relationships, foreign_key: :followed_id
  has_and_belongs_to_many :games
  #validations
  validates_presence_of :name, :email, :password
  validates_confirmation_of :email, :password
  validates_length_of :name, maximum: 50, too_long: 'Please, choose a name within 50 chars!'
  validates_length_of :password, minimum: 6, too_short: 'Please, choose a longer password, 6 chars at least!'
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create, message: 'Email format is invalid'
end
