require 'integration_test_helper'

class UiTestsTest < ActionDispatch::IntegrationTest
  #fixtures :all
  
  # Franz Josef Brünner Tests
  
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
  
  test "user is registering" do
    #visit register_path #root_path
    #fill_in 'username', :with => @dummy_user.username
    #fill_in 'password', :with => @dummy_user.password
    #fill_in 'facebookEmail', :with => @dummy_user.facebookEmail
    
    #click_button ' Registrieren '
    #assert_equal true, page.has_content?('Erfolgreich registriert')
  end
  
  test "user is trying to log in" do
    visit root_path #root_path
    fill_in 'username', :with => @dummy_user.username
    fill_in 'password', :with => @dummy_user.password
    
    click_button ' Login '
    assert_equal true, page.has_content?('Erfolgreich eingeloggt')
  end
  
  test "user has entered wrong username" do
    #visit root_path #root_path
    #fill_in 'username', :with => @dummy_user.username.to_s << "_"
    #fill_in 'password', :with => @dummy_user.password
    
    #click_button ' Login '
    #assert_equal true, page.has_content?(' Login ')
    
  end
  
  test "user has entered wrong password" do
    #visit root_path #root_path
    #fill_in 'username', :with => @dummy_user.username
    #fill_in 'password', :with => "_" << @dummy_user.password.to_s
    
    #click_button ' Login '
    #assert_equal true, page.has_content?(' Login ')
    
  end
  
  test "user wants to change their profile" do 
    
    #visit profile_path
    #fill_in 'oldPassword', :with => @password
    #click_button ' Neues Passwort '
    #fill_in 'user_password', :with => "geheim2"
    #click_button 'user_submit'
    
    #page.has_content?('geheim2')
    
  end
  
end
