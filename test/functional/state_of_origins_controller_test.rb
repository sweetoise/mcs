require 'test_helper'

class StateOfOriginsControllerTest < ActionController::TestCase
  setup do
    @state_of_origin = state_of_origins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:state_of_origins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create state_of_origin" do
    assert_difference('StateOfOrigin.count') do
      post :create, state_of_origin: { name: @state_of_origin.name }
    end

    assert_redirected_to state_of_origin_path(assigns(:state_of_origin))
  end

  test "should show state_of_origin" do
    get :show, id: @state_of_origin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @state_of_origin
    assert_response :success
  end

  test "should update state_of_origin" do
    put :update, id: @state_of_origin, state_of_origin: { name: @state_of_origin.name }
    assert_redirected_to state_of_origin_path(assigns(:state_of_origin))
  end

  test "should destroy state_of_origin" do
    assert_difference('StateOfOrigin.count', -1) do
      delete :destroy, id: @state_of_origin
    end

    assert_redirected_to state_of_origins_path
  end
end
