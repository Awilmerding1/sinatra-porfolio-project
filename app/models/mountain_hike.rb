class MountainHike < ActiveRecord::Base
  belongs_to :hike
  belongs_to :mountain

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
end
