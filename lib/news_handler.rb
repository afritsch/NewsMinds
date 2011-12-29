require 'rss/1.0'
require 'rss/2.0'


class NewsHandler
  
  def initialize 
    loadRSSFeeds
  end

  def copyRSSIntoDatabase
    DalyNews.destroy_all

    for i in 0...@raw_data.items.count do
      news = DalyNews.new
      news.title = @raw_data.items[i].title
      news.description = @raw_data.items[i].description
      news.date = @raw_data.items[i].pubDate.to_s
      news.clicks = 0
      news.save       
    end
  end
  

  def checkThemeList
    if !isDataUpToDate?      
      copyRSSIntoDatabase 
    end
  end  
  
  
  # the deadline of a topstory is 12 o clock the day after it was elected 
  def hasTopStoryDeadlineEnded?
    Time.now.to_s.slice(11..12).to_i > 11 
  end


  # is there still a new TopStory theme
  def isTopStoryUpToDate?
    TopStory.last.pubDate.slice(8..9).eql? Time.now.to_s.slice(8..9)
  end
  
 
  def insertThemeIntoTopStoryDatabase 
    news = findMostClickedTheme

    story = TopStory.new
    story.title = news.title
    story.description = news.description
    story.pubDate = Time.now.to_s
    story.chosen = news.clicks
    story.save
  end


  def isNewMonth?
    !(TopStory.first.pubDate.slice(5..6).eql? Time.now.to_s.slice(5..6)) 
  end
  
  
  # ereases all entries except of the youngest
  def eraseOldTopStoryEntries
    for i in 0...TopStory.count-1
      TopStory.first.destroy
    end
  end


  def eraseOldPosts
    Post.destroy_all
  end


  private

  def findMostClickedTheme
    number = 0
    DalyNews.all.each do |news|
      if news.clicks > number
        number = news.clicks
      end
    end

    DalyNews.where( :clicks => number ).first
  end

  
  # if the first feed is up to date data must not be loaded in again 
  def isDataUpToDate?
    DalyNews.first.date.slice(5..6).eql? Time.now.to_s.slice(8..9)
  end
 
  
  # all themes are loaded in from nachrichten.at by RSS Feeds
  def loadRSSFeeds 
    @raw_data = RSS::Parser.parse('http://www.nachrichten.at/storage/rss/rss/weltspiegel.xml', false)
  end
  
end



