require 'test_helper'

class DailyNewsTest < ActiveSupport::TestCase

  setup do
    loadRSSFeeds
    copyRSSIntoDatabase
  end
  
  def teardown
  end
  
  test "list all daily news without top story" do
    
    story = TopStory.create( :title => DailyNews.find( (rand * DailyNews.all.count).floor ).title, :description => DailyNews.find( (rand * DailyNews.all.count).floor ).description, :chosen => 0 )
    
    news = DailyNews.onlyThemes # story must not be in the list
    
    for i in 0...news.count do
      assert_equal true, news[i].title != story.title 
    end
    
  end
end
