require 'test_helper'

class NoneUiTestsTest < ActionDispatch::IntegrationTest
  #fixtures :all
  setup do 
    @username = 'Mr.Test'
    @password = 'geheim'
    @facebookEmail = 'mr.test@test.com'
    
    @dummy_user = create_dummy_user(@username, @password, @facebookEmail)
    
    @top_story_params = { :title => "teststory", :description => "test description", :chosen => 0 }
    TopStory.create(@top_story_params)
    
    @daily_news_params = { :title => "teststory", :description => "test description", :clicks => 0, :theme_url => "www.test.com" }
    DailyNews.create(@daily_news_params)
  end
   
  def teardown
    User.destroy_all
    TopStory.destroy_all
    DailyNews.destroy_all
  end
  
  # Replace this with your real tests.
  test "TopStory should replaced by new TopStory automaticlly" do
    visit top_stories_path
    
    time = Time.now
    time = Time.local(time.year, time.month, time.day, 12) # at 12:00 o clock a new TopStory should appear
    Timecop.travel(time)
    
    latest_top_story_id = TopStory.last.id
    
    time = Time.local(time.year, time.month, time.day+1, 12) # at 12:00 o clock a new TopStory should appear
    Timecop.travel(time)
    
    visit top_stories_path
    assert_equal true, latest_top_story_id == TopStory.last.id-1
    
  end
end
