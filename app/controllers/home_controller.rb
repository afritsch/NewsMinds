﻿class HomeController < ApplicationController

  def index

    handler = NewsHandler.new

    if handler.isNewMonth 
      handler.eraseOldTopStoryEntries
      handler.eraseOldPosts
    end

    respond_to do |format|
      format.html
      format.xml  
    end
   
  end

end
