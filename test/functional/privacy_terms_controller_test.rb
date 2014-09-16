require 'test_helper'

class PrivacyTermsControllerTest < ActionController::TestCase
  setup do
    @privacy_term = privacy_terms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:privacy_terms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create privacy_term" do
    assert_difference('PrivacyTerm.count') do
      post :create, privacy_term: { description: @privacy_term.description, introduction: @privacy_term.introduction, policy: @privacy_term.policy }
    end

    assert_redirected_to privacy_term_path(assigns(:privacy_term))
  end

  test "should show privacy_term" do
    get :show, id: @privacy_term
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @privacy_term
    assert_response :success
  end

  test "should update privacy_term" do
    put :update, id: @privacy_term, privacy_term: { description: @privacy_term.description, introduction: @privacy_term.introduction, policy: @privacy_term.policy }
    assert_redirected_to privacy_term_path(assigns(:privacy_term))
  end

  test "should destroy privacy_term" do
    assert_difference('PrivacyTerm.count', -1) do
      delete :destroy, id: @privacy_term
    end

    assert_redirected_to privacy_terms_path
  end
end
