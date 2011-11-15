require 'methods_daly_news/daly_news.rb'

class TopStoriesController < ApplicationController
  
  def discussion 
    
    @latest_top_story = TopStory.last

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @latest_top_story }
    end
  end
  
  def selectPrevDays
    
    @top_stories = TopStory.where( :id => params[:id] )
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @top_stories }
    end
  end 

end
