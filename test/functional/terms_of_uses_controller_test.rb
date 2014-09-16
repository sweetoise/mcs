require 'test_helper'

class TermsOfUsesControllerTest < ActionController::TestCase
  setup do
    @terms_of_use = terms_of_uses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:terms_of_uses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create terms_of_use" do
    assert_difference('TermsOfUse.count') do
      post :create, terms_of_use: { description: @terms_of_use.description, introduction: @terms_of_use.introduction, terms: @terms_of_use.terms }
    end

    assert_redirected_to terms_of_use_path(assigns(:terms_of_use))
  end

  test "should show terms_of_use" do
    get :show, id: @terms_of_use
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @terms_of_use
    assert_response :success
  end

  test "should update terms_of_use" do
    put :update, id: @terms_of_use, terms_of_use: { description: @terms_of_use.description, introduction: @terms_of_use.introduction, terms: @terms_of_use.terms }
    assert_redirected_to terms_of_use_path(assigns(:terms_of_use))
  end

  test "should destroy terms_of_use" do
    assert_difference('TermsOfUse.count', -1) do
      delete :destroy, id: @terms_of_use
    end

    assert_redirected_to terms_of_uses_path
  end
end
