ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActionDispatch::IntegrationTest
 include Capybara::DSL

 teardown do
  DatabaseCleaner.clean  
  Capybara.reset_sessions!    # Forget the (simulated) browser state
  Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
 end
 
end


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  #fixtures :all

  def create_dummy_user(username, password, facebookEmail)
    user_params = { :username => username, :password => password, :numberOfPosVotedPosts => 0, :numberOfNegVotedPosts => 0, :numberOfPosCreatedPosts => 0, :numberOfNegCreatedPosts => 0, :mind => 0, :votePower => 1, :facebookEmail => facebookEmail }
    
    user = User.new(user_params)
    user.save
    user    
  end
  
end
