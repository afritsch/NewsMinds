require 'rss/1.0'
require 'rss/2.0'

class TopStory < ActiveRecord::Base
  
  #def self.deleteExeptCurrent
    
  #  for i in 0...(count-1)
  #    first.destroy
  #  end
    
  #end
  
  #def self.insertThemeIntoTopStoryDatabase 
  #  news = findMostClickedTheme
  #
  #  story = TopStory.new
  #  story.title = news.title
  #  story.description = news.description
  #  story.pubDate = Time.now.to_s
  #  story.chosen = news.clicks
  #  story.save
  #end
  
  
  #def self.copyRSSIntoDatabase
  #  loadRSSFeeds
  #  DalyNews.destroy_all

  #  for i in 0...@raw_data.items.count do
  #    news = DalyNews.new
  #    news.title = @raw_data.items[i].title
  #    news.description = @raw_data.items[i].description
  #    news.date = @raw_data.items[i].pubDate.to_s
  #    news.clicks = 0
  #    news.save       
  #  end
  #end
  
  
  has_many :posts, :dependent => :destroy

  
  #private
  
  #def self.loadRSSFeeds 
  #  @raw_data = RSS::Parser.parse('http://www.nachrichten.at/storage/rss/rss/weltspiegel.xml', false)
  #end
  
  
  #def self.findMostClickedTheme
  #  number = 0
  #  DalyNews.all.each do |news|
  #    if news.clicks > number
  #      number = news.clicks
  #    end
  #  end

  #  DalyNews.where( :clicks => number ).first
  #end
 
end
