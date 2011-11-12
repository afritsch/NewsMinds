class User < ActiveRecord::Base
  validates :username, :presence => true, :format => { :with => /^\D\w{4,12}/ }
  validates :password, :presence => true, :length => { :minimum => 6 }
end
