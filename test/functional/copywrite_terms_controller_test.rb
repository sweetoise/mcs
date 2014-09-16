require 'test_helper'

class CopywriteTermsControllerTest < ActionController::TestCase
  setup do
    @copywrite_term = copywrite_terms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:copywrite_terms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create copywrite_term" do
    assert_difference('CopywriteTerm.count') do
      post :create, copywrite_term: { content: @copywrite_term.content, term: @copywrite_term.term }
    end

    assert_redirected_to copywrite_term_path(assigns(:copywrite_term))
  end

  test "should show copywrite_term" do
    get :show, id: @copywrite_term
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @copywrite_term
    assert_response :success
  end

  test "should update copywrite_term" do
    put :update, id: @copywrite_term, copywrite_term: { content: @copywrite_term.content, term: @copywrite_term.term }
    assert_redirected_to copywrite_term_path(assigns(:copywrite_term))
  end

  test "should destroy copywrite_term" do
    assert_difference('CopywriteTerm.count', -1) do
      delete :destroy, id: @copywrite_term
    end

    assert_redirected_to copywrite_terms_path
  end
end
