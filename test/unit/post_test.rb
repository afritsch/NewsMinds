require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  setup do
    story = TopStory.create( :title => "teststory", :description => "test description", :chosen => 0 )
    user = User.create( :username => "Mr.Test", :password => "geheim", :numberOfPosVotedPosts => 0, :numberOfNegVotedPosts => 0, :numberOfPosCreatedPosts => 0, :numberOfNegCreatedPosts => 0, :mind => 10, :votePower => 1, :facebookEmail => "mr.test@test.com" )
    
    @post_params = { :title => "testpost", :content => "testcontent", :estimation => 1, :score => 0, :voted_usernames => user.username }
    @post = Post.new( @post_params ) 
  
    @post.top_story_id = story.id
    @post.user_id = user.id
    @post.score = 0
    @post.voted_usernames = ""
    
    @post.estimation = 1
    @post.user.number_of_posts = 1
    
    @post.save
  end
  
  def teardown
    Post.destroy_all
    TopStory.destroy_all
    User.destroy_all
  end
  
  test "is post linked to user and TopStory succesfully?" do
    assert_not_equal nil, @post.user
    assert_not_equal nil, @post.top_story
  end
  
end
