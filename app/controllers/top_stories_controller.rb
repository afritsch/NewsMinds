class TopStoriesController < ApplicationController

  def discussion
    
    handler = NewsHandler.new

    # after twelve o clock a new theme is turned into a top story 
    # and new themes are loaded in

    if !handler.isTopStoryUpToDate? && handler.hasTopStoryDeadlineEnded?
      handler.insertThemeIntoTopStoryDatabase
      handler.checkThemeList
    end
    
    @latest_top_story = TopStory.last

  end
  

  def selectPrevDays  
    @top_stories = TopStory.where( :id => params[:id] ).first
  end 
  

  def archive
    @top_stories = TopStory.all
  end

end
