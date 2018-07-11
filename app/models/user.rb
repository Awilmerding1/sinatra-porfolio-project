class User < ActiveRecord::Base
  has_many :hikes
  has_many :mountains, through: :hikes

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, presence: true

  has_secure_password

end
