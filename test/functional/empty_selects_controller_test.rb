require 'test_helper'

class EmptySelectsControllerTest < ActionController::TestCase
  setup do
    @empty_select = empty_selects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empty_selects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empty_select" do
    assert_difference('EmptySelect.count') do
      post :create, empty_select: { name: @empty_select.name }
    end

    assert_redirected_to empty_select_path(assigns(:empty_select))
  end

  test "should show empty_select" do
    get :show, id: @empty_select
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empty_select
    assert_response :success
  end

  test "should update empty_select" do
    put :update, id: @empty_select, empty_select: { name: @empty_select.name }
    assert_redirected_to empty_select_path(assigns(:empty_select))
  end

  test "should destroy empty_select" do
    assert_difference('EmptySelect.count', -1) do
      delete :destroy, id: @empty_select
    end

    assert_redirected_to empty_selects_path
  end
end
