require 'test_helper'

class FacultyNoticesControllerTest < ActionController::TestCase
  setup do
    @faculty_notice = faculty_notices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faculty_notices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faculty_notice" do
    assert_difference('FacultyNotice.count') do
      post :create, faculty_notice: { content: @faculty_notice.content, date: @faculty_notice.date, faculty_id: @faculty_notice.faculty_id, signed_by: @faculty_notice.signed_by, title: @faculty_notice.title }
    end

    assert_redirected_to faculty_notice_path(assigns(:faculty_notice))
  end

  test "should show faculty_notice" do
    get :show, id: @faculty_notice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faculty_notice
    assert_response :success
  end

  test "should update faculty_notice" do
    put :update, id: @faculty_notice, faculty_notice: { content: @faculty_notice.content, date: @faculty_notice.date, faculty_id: @faculty_notice.faculty_id, signed_by: @faculty_notice.signed_by, title: @faculty_notice.title }
    assert_redirected_to faculty_notice_path(assigns(:faculty_notice))
  end

  test "should destroy faculty_notice" do
    assert_difference('FacultyNotice.count', -1) do
      delete :destroy, id: @faculty_notice
    end

    assert_redirected_to faculty_notices_path
  end
end
