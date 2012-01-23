# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class TopStory < ActiveRecord::Base

  has_many :posts, :dependent => :destroy

end
