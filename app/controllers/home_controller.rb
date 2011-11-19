require 'methods_daly_news/daly_news.rb'

class HomeController < ApplicationController

  def index

    handler = DalyNewsHandler.new

    if handler.isNewMonth 
      handler.ereaseOldTopStoryEntries
    end

    respond_to do |format|
      format.html
      format.xml  
    end
   
  end

end
