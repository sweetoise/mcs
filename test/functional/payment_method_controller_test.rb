require 'test_helper'

class PaymentMethodControllerTest < ActionController::TestCase
  test "should get bank_transfer" do
    get :bank_transfer
    assert_response :success
  end

end
