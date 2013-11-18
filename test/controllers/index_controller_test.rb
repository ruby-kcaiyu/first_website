require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get creat" do
    get :creat
    assert_response :success
  end

end
