require 'test_helper'

class TopStoriesControllerTest < ActionController::TestCase
  setup do
    @top_story = top_stories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_stories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_story" do
    assert_difference('TopStory.count') do
      post :create, :top_story => @top_story.attributes
    end

    assert_redirected_to top_story_path(assigns(:top_story))
  end

  test "should show top_story" do
    get :show, :id => @top_story.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @top_story.to_param
    assert_response :success
  end

  test "should update top_story" do
    put :update, :id => @top_story.to_param, :top_story => @top_story.attributes
    assert_redirected_to top_story_path(assigns(:top_story))
  end

  test "should destroy top_story" do
    assert_difference('TopStory.count', -1) do
      delete :destroy, :id => @top_story.to_param
    end

    assert_redirected_to top_stories_path
  end
end
