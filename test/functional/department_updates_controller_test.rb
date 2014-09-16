require 'test_helper'

class DepartmentUpdatesControllerTest < ActionController::TestCase
  setup do
    @department_update = department_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:department_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create department_update" do
    assert_difference('DepartmentUpdate.count') do
      post :create, department_update: { content: @department_update.content, date: @department_update.date, department_id: @department_update.department_id, signed_by: @department_update.signed_by, title: @department_update.title }
    end

    assert_redirected_to department_update_path(assigns(:department_update))
  end

  test "should show department_update" do
    get :show, id: @department_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @department_update
    assert_response :success
  end

  test "should update department_update" do
    put :update, id: @department_update, department_update: { content: @department_update.content, date: @department_update.date, department_id: @department_update.department_id, signed_by: @department_update.signed_by, title: @department_update.title }
    assert_redirected_to department_update_path(assigns(:department_update))
  end

  test "should destroy department_update" do
    assert_difference('DepartmentUpdate.count', -1) do
      delete :destroy, id: @department_update
    end

    assert_redirected_to department_updates_path
  end
end
