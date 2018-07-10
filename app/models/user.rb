class User < ActiveRecord::Base
  has_many :hikes
  has_many :mountains, through: :hikes

  has_secure_password

end
