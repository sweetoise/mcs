require 'test_helper'

class CopywriteAddressesControllerTest < ActionController::TestCase
  setup do
    @copywrite_address = copywrite_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:copywrite_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create copywrite_address" do
    assert_difference('CopywriteAddress.count') do
      post :create, copywrite_address: { address: @copywrite_address.address, description: @copywrite_address.description }
    end

    assert_redirected_to copywrite_address_path(assigns(:copywrite_address))
  end

  test "should show copywrite_address" do
    get :show, id: @copywrite_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @copywrite_address
    assert_response :success
  end

  test "should update copywrite_address" do
    put :update, id: @copywrite_address, copywrite_address: { address: @copywrite_address.address, description: @copywrite_address.description }
    assert_redirected_to copywrite_address_path(assigns(:copywrite_address))
  end

  test "should destroy copywrite_address" do
    assert_difference('CopywriteAddress.count', -1) do
      delete :destroy, id: @copywrite_address
    end

    assert_redirected_to copywrite_addresses_path
  end
end
