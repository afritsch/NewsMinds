require 'digest/sha1'

class UiTestsTest < ActionDispatch::IntegrationTest
  #fixtures :all
  
  # Franz Josef Brünner Tests
  
  
  def loginDummyUser
    visit root_path
    fill_in 'username', :with => @dummy_user.username
    fill_in 'password', :with => @password
    
    click_button ' Login '
  end
  
  setup do 
    @username = 'Mr.Test'
    @password = 'geheim'
    @facebookEmail = 'mr.test@test.com'
    @dummy_user = create_dummy_user(@username, Digest::SHA1.hexdigest(@password), @facebookEmail)
    
    
    @top_story_params = { :title => "teststory", :description => "test description", :chosen => 0 }
    TopStory.create(@top_story_params)
    
    @daily_news_params = { :title => "testdailynews", :description => "test description", :clicks => 0, :theme_url => "www.test.com" }
    DailyNews.create(@daily_news_params)
  end
   
  def teardown
    User.destroy_all
    TopStory.destroy_all
    DailyNews.destroy_all
  end
  
  test "user is registering with already used username" do
    visit register_path #root_path
    fill_in 'username', :with => @dummy_user.username
    fill_in 'password', :with => "geheim2"
    fill_in 'facebookEmail', :with => ""
    
    click_button ' Registrieren '
    assert_equal true, page.has_link?('Registrieren')
  end
  
  test "user is registering with already used Facebook-Email" do
    visit register_path #root_path
    fill_in 'username', :with => "Mr.Test2"
    fill_in 'password', :with => "geheim2"
    fill_in 'facebookEmail', :with => @dummy_user.facebookEmail
    
    click_button ' Registrieren '
    assert_equal true, page.has_content?('Username oder Facebook Email Adresse schon vorhanden!')
  end
  
  test "user is trying to log in with correct userinfo" do # this test has to go through in ordner to set session[:id] for next tests
    
    visit root_path
    fill_in 'username', :with => @dummy_user.username
    fill_in 'password', :with => @password
    
    click_button ' Login '
    
    assert_equal true, page.has_button?(' Logout ')
    
  end
  
  test "user has entered wrong username" do
    
    Capybara.using_session("id") do
      visit root_path
      fill_in 'username', :with => @dummy_user.username.to_s << "_"
      fill_in 'password', :with => @dummy_user.password
    
      click_button ' Login '
      assert_equal true, page.has_content?('Falsche Eingabe')
    end
    
  end
  
  test "user has entered wrong password" do
  
    Capybara.using_session("id") do
      visit root_path
      fill_in 'username', :with => @dummy_user.username.to_s
      fill_in 'password', :with => @password << "_"
    
      click_button ' Login '
      assert_equal true, page.has_content?('Falsche Eingabe')
    end
    
  end
  
  test "user wants to change their password" do 
    
    Capybara.using_session("id") do
       
      loginDummyUser
      
      visit profile_path
      
      fill_in 'oldPassword', :with => @password
      click_button ' Neues Passwort '
      fill_in 'user_password', :with => "geheim2"
      click_button 'user_submit'
      
      assert_equal true, page.has_content?('erfolgreich')
    end
    
  end
  
  test "user wants to change their Facebook-Email Address" do 
    
    Capybara.using_session("id") do
       
      loginDummyUser
      
      visit profile_path
      
      fill_in 'user_facebookEmail', :with => @password
      click_button 'user_submit'
      
      assert_equal true, page.has_content?('erfolgreich')
    end
    
  end
  
  test "user votes for a DailyNews" do
    
    Capybara.using_session("id") do
      
      loginDummyUser
      
      visit choose_theme_path
      
      click_link DailyNews.first.id.to_s
      
      assert_equal true, page.has_content?(' gestimmt')
    end
  end
  
end
