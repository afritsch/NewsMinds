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
