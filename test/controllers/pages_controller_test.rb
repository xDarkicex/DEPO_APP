require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get FAQ" do
    get :FAQ
    assert_response :success
  end

  test "should get NEWS" do
    get :NEWS
    assert_response :success
  end

end
