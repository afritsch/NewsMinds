class User < ActiveRecord::Base
  devise :database_authenticatable, :oauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
         
  validates :username, :presence => true, :format => { :with => /^\D{1,1}\S{3,12}$/ }
  validates :password, :presence => true, :format => { :with => /^\S{6,15}$/ }

  has_many :posts, :dependent => :destroy

  def self.loggedInUser( username )
    where( :username => username ).first
  end

end
