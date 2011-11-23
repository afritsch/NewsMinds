require 'rss/1.0'
require 'rss/2.0'


class DalyNewsHandler
  
  def initialize 
    getUpdated  
  end


  def isUpToDate
   
    # first item of rss is up to date so first instead of last 
    if ((DalyNews.first.date.slice(5..6) <=> Time.now.to_s.slice(8..9)) == 0)
      return true
    else
      return false
    end
  end
 

  def getUpdated 
    @raw_data = RSS::Parser.parse('http://www.nachrichten.at/storage/rss/rss/weltspiegel.xml', false)
  end
  
  
  def copyToDatabase
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
  

  def checkDalyNewsList
    if !isUpToDate      
      copyToDatabase 
    end
  end  
  
  
  def checkAndInsertNewsIntoTopStoryDatabase 
    DalyNews.all.each do |news|
      if news.clicks >= 5 && ((TopStory.last.pubDate.slice(8..9) <=> Time.now.to_s.slice(8..9)) != 0) 
        story = TopStory.new
        story.title = news.title
        story.description = news.description
        story.pubDate = Time.now.to_s
        story.chosen = news.clicks
        story.save
        
        break 
      end  
    end
  end
 

  def isNewMonth
    if ((Time.now.to_s.slice(5..6) <=> TopStory.first.pubDate.slice(5..6)) != 0)
      return true
    else
      return false
    end
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


  # checks if a top story is chosen today 
  def hasGotTopStory
    if ((Time.now.to_s.slice(8..9) <=> TopStory.last.pubDate.slice(8..9)) == 0)
      return true
    else
      return false
    end 
  end

end



