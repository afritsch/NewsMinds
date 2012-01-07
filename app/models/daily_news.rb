# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class DailyNews < ActiveRecord::Base
  def self.onlyThemes
    find(:all, :conditions => ["title != ?",TopStory.last.title])
  end
end
