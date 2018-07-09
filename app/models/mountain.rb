class Mountain < ActiveRecord::Base
  has_many :mountain_lists
  has_many :lists, through: :mountain_lists
  has_many :users, through: :lists

end
