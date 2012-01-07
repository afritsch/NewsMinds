# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class HomeController < ApplicationController

  def index

    handler = NewsHandler.new

    if handler.isNewMonth? 
      handler.eraseOldTopStoryEntries # erases old top stories except youngest
    end

  end

end
