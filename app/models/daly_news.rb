class DalyNews < ActiveRecord::Base
  def self.onlyThemes
    find_by_sql("SELECT * FROM 'daly_news' WHERE( title != '#{TopStory.last.title}')") 
  end
end
