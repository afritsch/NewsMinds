require 'test_helper'

class TopStoryTest < ActiveSupport::TestCase

  # Franz Josef Brünner Tests
  
  setup do
    @top_story_params = { :title => "teststory", :description => "test description", :chosen => 0 }
  end
  
  test "is TopStory up to date?" do
    
    story_one = TopStory.create(@top_story_params)
    
    Timecop.freeze(Date.today + 1) do
      assert_equal false, story_one.isUpToDate?
    end
    
  end
  
  test "has TopStory-deadline ended?" do
    story_one = TopStory.create(@top_story_params)
    
    time = Time.now
    time = Time.local(time.year, time.month, time.day, 12) # at 12:00 o clock a TopStory should end
    Timecop.travel(time)
    
    assert_equal true, story_one.hasDeadlineEnded?
    
  end
  
end
