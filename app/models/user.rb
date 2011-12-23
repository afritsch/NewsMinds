class User < ActiveRecord::Base
  validates :username, :presence => true, :format => { :with => /^\D{1,1}\S{3}\S*$/ }
  validates :password, :presence => true, :format => { :with => /^\S{6}\S*$/ }

  has_many :posts, :dependent => :destroy

  def self.loggedInUser( username )
    where( :username => username ).first
  end

end
