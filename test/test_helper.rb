ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'rss/1.0'
require 'rss/2.0'

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

  # Franz Josef Brünner Tests
  
  def create_dummy_user(username, password, facebookEmail)
    user_params = { :username => username, :password => password, :numberOfPosVotedPosts => 0, :numberOfNegVotedPosts => 0, :numberOfPosCreatedPosts => 0, :numberOfNegCreatedPosts => 0, :mind => 0, :votePower => 1, :facebookEmail => facebookEmail }
    
    user = User.new(user_params)
    user.save
    user    
  end
  
  
  def loadRSSFeeds 
    @raw_data = RSS::Parser.parse('http://www.nachrichten.at/storage/rss/rss/weltspiegel.xml', false)
  end
  
  
  def copyRSSIntoDatabase
    DailyNews.destroy_all

    for i in 0...@raw_data.items.count do
      news = DailyNews.new
      news.title = @raw_data.items[i].title
      news.description = @raw_data.items[i].description
      news.clicks = 0
      news.theme_url = @raw_data.items[i].link.to_s
      news.save       
    end
  end
  
end
