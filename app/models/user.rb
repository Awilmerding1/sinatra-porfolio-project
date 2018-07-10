class User < ActiveRecord::Base
  has_many :mountains, through: :lists

  has_secure_password

end
