# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class User < ActiveRecord::Base
  validates :username, :presence => true, :format => { :with => /^\D{1,1}\S{3,}$/ }
  validates :password, :presence => true, :format => { :with => /^\S{6,}$/ }

  has_many :posts, :dependent => :destroy

  def self.loggedInUser( id )
    where( :id => id ).first
  end

end
