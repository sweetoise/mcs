require 'test_helper'

class DepartmentNoticesControllerTest < ActionController::TestCase
  setup do
    @department_notice = department_notices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:department_notices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create department_notice" do
    assert_difference('DepartmentNotice.count') do
      post :create, department_notice: { content: @department_notice.content, date: @department_notice.date, department_id: @department_notice.department_id, signed_by: @department_notice.signed_by, title: @department_notice.title }
    end

    assert_redirected_to department_notice_path(assigns(:department_notice))
  end

  test "should show department_notice" do
    get :show, id: @department_notice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @department_notice
    assert_response :success
  end

  test "should update department_notice" do
    put :update, id: @department_notice, department_notice: { content: @department_notice.content, date: @department_notice.date, department_id: @department_notice.department_id, signed_by: @department_notice.signed_by, title: @department_notice.title }
    assert_redirected_to department_notice_path(assigns(:department_notice))
  end

  test "should destroy department_notice" do
    assert_difference('DepartmentNotice.count', -1) do
      delete :destroy, id: @department_notice
    end

    assert_redirected_to department_notices_path
  end
end
