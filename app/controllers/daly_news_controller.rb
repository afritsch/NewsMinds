require 'methods_daly_news/daly_news.rb'

class DalyNewsController < ApplicationController
    
  def chooseTheme
    
    handler = DalyNewsHandler.new
 
    #load DalyNews if nesseccary 
    handler.checkDalyNewsList
 
    @daly_news = DalyNews.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @top_stories }
    end
  end
  
  def voteForTheme
    
    @voted_news = DalyNews.where( :id => params[:id] )
    @voted_news[0].clicks += 1
    @voted_news[0].save
   
    handler = DalyNewsHandler.new

    # if new news is selected, insert it into top_news database    
    handler.checkAndInsertNewsIntoTopStoryDatabase

    respond_to do |format|
      format.html
      format.xml  { render :xml => @voted_news }
    end
 
  end
end
