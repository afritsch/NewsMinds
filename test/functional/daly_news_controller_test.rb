require 'test_helper'

class DalyNewsControllerTest < ActionController::TestCase
  test "should get chooseTheme" do
    get :chooseTheme
    assert_response :success
  end

end
