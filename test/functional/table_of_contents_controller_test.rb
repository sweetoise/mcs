require 'test_helper'

class TableOfContentsControllerTest < ActionController::TestCase
  setup do
    @table_of_content = table_of_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:table_of_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create table_of_content" do
    assert_difference('TableOfContent.count') do
      post :create, table_of_content: { description: @table_of_content.description, title: @table_of_content.title }
    end

    assert_redirected_to table_of_content_path(assigns(:table_of_content))
  end

  test "should show table_of_content" do
    get :show, id: @table_of_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @table_of_content
    assert_response :success
  end

  test "should update table_of_content" do
    put :update, id: @table_of_content, table_of_content: { description: @table_of_content.description, title: @table_of_content.title }
    assert_redirected_to table_of_content_path(assigns(:table_of_content))
  end

  test "should destroy table_of_content" do
    assert_difference('TableOfContent.count', -1) do
      delete :destroy, id: @table_of_content
    end

    assert_redirected_to table_of_contents_path
  end
end
