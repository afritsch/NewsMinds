class DalyNews < ActiveRecord::Base
  def self.onlyThemes
    find(:all, :conditions => ["title != ?",TopStory.last.title])
  end
end
