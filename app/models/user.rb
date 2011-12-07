class User < ActiveRecord::Base
  validates :username, :presence => true, :format => { :with => /^\D{1,1}\S{3,12}$/ }
  validates :password, :presence => true, :format => { :with => /^\S{6,15}$/ }

  has_many :posts, :dependent => :destroy
end
