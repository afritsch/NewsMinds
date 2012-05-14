require 'test_helper'

class TopStoryTest < ActiveSupport::TestCase
  setup do
    @top_story_params = { :title => "teststory", :description => "test description", :chosen => 0 }
  end
  
  test "is top story up to date?" do
    
    story_one = TopStory.create(@top_story_params)
    
    Timecop.freeze(Date.today + 1) do
      assert_equal false, story_one.isUpToDate?
    end
    
  end
  
end
