class Post < ActiveRecord::Base
  belongs_to :top_story
  belongs_to :user
end
