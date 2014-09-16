require 'test_helper'

class ScanControllerTest < ActionController::TestCase
  test "should get pin_attempt" do
    get :pin_attempt
    assert_response :success
  end

end
