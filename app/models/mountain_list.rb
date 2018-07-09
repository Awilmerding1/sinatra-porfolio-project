class MountainList < ActiveRecord::Base
  belongs_to :mountain
  belongs_to :list 
end
