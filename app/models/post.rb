class Post < ActiveRecord::Base
  belongs_to :daly_news
  belongs_to :top_story
end
