require 'test_helper'

class FacultyUpdatesControllerTest < ActionController::TestCase
  setup do
    @faculty_update = faculty_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faculty_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faculty_update" do
    assert_difference('FacultyUpdate.count') do
      post :create, faculty_update: { content: @faculty_update.content, date: @faculty_update.date, faculty_id: @faculty_update.faculty_id, signed_by: @faculty_update.signed_by, title: @faculty_update.title }
    end

    assert_redirected_to faculty_update_path(assigns(:faculty_update))
  end

  test "should show faculty_update" do
    get :show, id: @faculty_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faculty_update
    assert_response :success
  end

  test "should update faculty_update" do
    put :update, id: @faculty_update, faculty_update: { content: @faculty_update.content, date: @faculty_update.date, faculty_id: @faculty_update.faculty_id, signed_by: @faculty_update.signed_by, title: @faculty_update.title }
    assert_redirected_to faculty_update_path(assigns(:faculty_update))
  end

  test "should destroy faculty_update" do
    assert_difference('FacultyUpdate.count', -1) do
      delete :destroy, id: @faculty_update
    end

    assert_redirected_to faculty_updates_path
  end
end
