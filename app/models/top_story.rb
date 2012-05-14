# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class TopStory < ActiveRecord::Base

  has_many :posts, :dependent => :destroy
   
   
  def isUpToDate?
    created_at.strftime('%d').eql? Time.now.strftime('%d')
  end
  
end
