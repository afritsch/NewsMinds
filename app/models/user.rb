# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true, :format => { :with => /^\D{1,1}\S{3,}$/ }
  validates :password, :presence => true, :format => { :with => /^\S{6,}$/ }
  
  has_many :posts, :dependent => :destroy
  
  def number_of_posts=(val)
    if val == 'positiv'
      val = numberOfPosCreatedPosts + 1
      write_attribute( :numberOfPosCreatedPosts, val )  
    else
      val = numberOfNegCreatedPosts + 1
      write_attribute( :numberOfNegCreatedPosts, val )  
    end      
  end
  
end
