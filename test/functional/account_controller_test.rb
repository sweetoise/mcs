require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get active_subscription" do
    get :active_subscription
    assert_response :success
  end

  test "should get expired_subscription" do
    get :expired_subscription
    assert_response :success
  end

end
