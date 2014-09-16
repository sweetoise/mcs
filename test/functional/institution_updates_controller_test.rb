require 'test_helper'

class InstitutionUpdatesControllerTest < ActionController::TestCase
  setup do
    @institution_update = institution_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:institution_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create institution_update" do
    assert_difference('InstitutionUpdate.count') do
      post :create, institution_update: { content: @institution_update.content, institution_id: @institution_update.institution_id, title: @institution_update.title }
    end

    assert_redirected_to institution_update_path(assigns(:institution_update))
  end

  test "should show institution_update" do
    get :show, id: @institution_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @institution_update
    assert_response :success
  end

  test "should update institution_update" do
    put :update, id: @institution_update, institution_update: { content: @institution_update.content, institution_id: @institution_update.institution_id, title: @institution_update.title }
    assert_redirected_to institution_update_path(assigns(:institution_update))
  end

  test "should destroy institution_update" do
    assert_difference('InstitutionUpdate.count', -1) do
      delete :destroy, id: @institution_update
    end

    assert_redirected_to institution_updates_path
  end
end
