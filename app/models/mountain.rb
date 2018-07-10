class Mountain < ActiveRecord::Base
  has_many :mountain_hikes
  has_many :hikes, through: :mountain_hikes
  has_many :users, through: :hikes



end
