# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true
  validates :estimation, :presence => true
  
  def estimation=(val) 
    write_attribute( :estimation, val == 'positiv' ? 1 : 0 )  
  end
  
  belongs_to :user
  belongs_to :top_story
end
