class User < ActiveRecord::Base
  has_many :hikes
  has_many :mountains, through: :hikes

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, presence: true

  def username_validation_method
   errors[:username] = "That username is already taken"
  end

  has_secure_password

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods

end
