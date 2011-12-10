class HomeController < ApplicationController

  def index

    handler = NewsHandler.new

    if handler.isNewMonth? 
      handler.eraseOldTopStoryEntries # erases old top stories except youngest
      handler.eraseOldPosts
    end

  end

end
