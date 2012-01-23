# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

module ApplicationHelper
  
  def hasGotTopStory?
    Time.now.created_at.strftime('%d').eql? TopStory.last.created_at.strftime('%d')
  end

end
