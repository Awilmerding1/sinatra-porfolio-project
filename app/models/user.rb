class User < ActiveRecord::Base
  has_one :list
  has_many :mountains, through: :list

  has_secure_password

end
