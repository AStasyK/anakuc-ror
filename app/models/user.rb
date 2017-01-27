class User < ApplicationRecord
  #before
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  #security
  has_secure_password

  #connections
  has_many :relationships, foreign_key: :follower_id
  has_many :followers, through: :relationships, source: :follower
  has_many :reverse_relationships, class_name: 'Relationship', foreign_key: :followed_id
  has_many :followeds, through: :relationships, source: :followed
  has_and_belongs_to_many :games
  has_many :values
  has_many :favourites
  has_many :images, through: :favourites

  #validations
  validates_presence_of :name, :email, :password
  validates_confirmation_of :email, :password
  validates_length_of :name, maximum: 50, too_long: 'Please, choose a name within 50 chars!'
  validates_length_of :password, minimum: 6, too_short: 'Please, choose a longer password, 6 chars at least!'
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create, message: 'Email format is invalid'
  validates_uniqueness_of :email, case_sensitive: false
  #remeber_token generation
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt token
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
