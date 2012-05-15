require 'test_helper'

class UiTestsTest < ActionDispatch::IntegrationTest
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
  
  test "user is trying to log in" do
    visit root_path #root_path
    fill_in 'username', :with => "Mr.Test"
    fill_in 'password', :with => "geheim"
    
    click_button ' Login '
    page.has_content?(' Logout ')
  end
  
  test "user wants to cahnge their profile" do 
    
    visit profile_path
    fill_in 'oldPassword', :with => @password
    click_button ' Neues Passwort '
    fill_in 'user_password', :with => "geheim2"
    click_button 'user_submit'
    
    page.has_content?('geheim2')
    
  end
  
  test "user is selecting a story" do
    #visit choose_theme_path
    
    #cookies[:voted] = { :value => "voted", :expires => 23.hours.from_now } 
    
    #Timecop.freeze(Date.today + 1) do
    #  visit '/chooseTheme'
    #  click_link('/daily_news/'+DailyNews.last.id.to_s)
    #  page.has_content?('choosetheme')
    #end
    
  end
end
