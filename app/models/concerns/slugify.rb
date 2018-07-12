module Slugify
  module InstanceMethods

    def slug
      if self.class == User
        self.username.gsub(/\s/,'-').downcase
      elsif self.class == Mountain
        self.name.gsub(/\s/,'-').downcase
      end
    end

  end
  module ClassMethods

    def find_by_slug(slug)
      self.all.each do |s|
        if s.slug == slug
          return s
        end
      end
    end

  end
end
