# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class HomeController < ApplicationController

  def index

    handler = NewsHandler.new
    
    if handler.isNewMonth? 
      handler.eraseOldTopStoryEntries # erases old top stories except youngest
    end
    
    handler.checkThemeList
     
    @latest_top_story = TopStory.last
    
    numPosts = @latest_top_story.posts.count
  
    @latest_posts = @latest_top_story.posts.order("id DESC").limit(3)
    
  end
  
  def about
  end
  
  def impressum
  end

end
