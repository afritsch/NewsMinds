require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # Franz Josef Brünner Tests
  
  setup do
    @user_params = { :username => "Mr.Test", :password => "geheim", :numberOfPosVotedPosts => 0, :numberOfNegVotedPosts => 0, :numberOfPosCreatedPosts => 0, :numberOfNegCreatedPosts => 0, :mind => 10, :votePower => 1, :facebookEmail => "mr.test@test.com" }
  end
  
  test "does username already exist?" do
    user = User.new(@user_params)
    user.save
    
    user = User.new(@user_params)
    assert_equal true, !user.save
  end
  
  test "does user-facebook-E-Mail already exist?" do
    user_one = User.new(@user_params)
    user_one.save
    
    @user_params = { :username => "Mr.Test2", :password => "geheim", :numberOfPosVotedPosts => 0, :numberOfNegVotedPosts => 0, :numberOfPosCreatedPosts => 0, :numberOfNegCreatedPosts => 0, :mind => 0, :votePower => 0, :facebookEmail => "mr.test@test.com" }

    user_two = User.new(@user_params)
    assert_equal user_one.facebookEmail, user_two.facebookEmail
  end
  
  test "User is voted by Post" do
    user = User.new(@user_params)
    
    tmpNum = user.numberOfPosCreatedPosts
    user.number_of_posts = 'positiv'
    
    assert_equal tmpNum+1, user.numberOfPosCreatedPosts
  end
  
end
