class MountainHike < ActiveRecord::Base
  belongs_to :hike
  belongs_to :mountain
end
