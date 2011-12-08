class TopStoriesController < ApplicationController

  def discussion
    
    handler = NewsHandler.new

    # after twelve o clock a new theme is turned into a top story 
    # and new themes are loaded in

    if !handler.isTopStoryUpToDate? && !handler.hasTopStoryDeadlineEnded?
      handler.insertThemeIntoTopStoryDatabase
      handler.checkThemeList
    end

    @latest_top_story = TopStory.last

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @latest_top_story }
    end
  end
  

  def selectPrevDays
    
    @top_stories = TopStory.where( :id => params[:id] ).first
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @top_stories }
    end
  end 
  

  def archive
    @top_stories = TopStory.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @top_stories }
    end
  end

end
