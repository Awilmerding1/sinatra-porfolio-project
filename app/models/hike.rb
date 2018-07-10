class Hike < ActiveRecord::Base
  belongs_to :user
  has_many :mountain_hikes
  has_many :mountains, through: :mountain_hikes
end
