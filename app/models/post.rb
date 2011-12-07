class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true
  validates :estimation, :presence => true

  belongs_to :user, :dependent => :destroy
  belongs_to :top_story, :dependent => :destroy
end
