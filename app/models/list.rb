class List < ActiveRecord::Base
  belongs_to :user
  has_many :mountain_lists
  has_many :mountains, through: :mountain_lists

end
