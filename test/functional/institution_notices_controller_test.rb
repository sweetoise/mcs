require 'test_helper'

class InstitutionNoticesControllerTest < ActionController::TestCase
  setup do
    @institution_notice = institution_notices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:institution_notices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create institution_notice" do
    assert_difference('InstitutionNotice.count') do
      post :create, institution_notice: { content: @institution_notice.content, date: @institution_notice.date, institution_id: @institution_notice.institution_id, signed_by: @institution_notice.signed_by, title: @institution_notice.title }
    end

    assert_redirected_to institution_notice_path(assigns(:institution_notice))
  end

  test "should show institution_notice" do
    get :show, id: @institution_notice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @institution_notice
    assert_response :success
  end

  test "should update institution_notice" do
    put :update, id: @institution_notice, institution_notice: { content: @institution_notice.content, date: @institution_notice.date, institution_id: @institution_notice.institution_id, signed_by: @institution_notice.signed_by, title: @institution_notice.title }
    assert_redirected_to institution_notice_path(assigns(:institution_notice))
  end

  test "should destroy institution_notice" do
    assert_difference('InstitutionNotice.count', -1) do
      delete :destroy, id: @institution_notice
    end

    assert_redirected_to institution_notices_path
  end
end
