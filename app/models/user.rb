class User < ActiveRecord::Base
  has_many :hikes
  has_many :mountains, through: :hikes

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_secure_password

end
