require 'test_helper'

class DailyNewsControllerTest < ActionController::TestCase
  test "should get chooseTheme" do
    get :chooseTheme
    assert_response :success
  end

end
