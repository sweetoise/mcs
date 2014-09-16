require 'test_helper'

class SecondSemesterLibraryBookOutlinesControllerTest < ActionController::TestCase
  setup do
    @second_semester_library_book_outline = second_semester_library_book_outlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:second_semester_library_book_outlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create second_semester_library_book_outline" do
    assert_difference('SecondSemesterLibraryBookOutline.count') do
      post :create, second_semester_library_book_outline: { book_url: @second_semester_library_book_outline.book_url, content: @second_semester_library_book_outline.content, second_semester_library_book_id: @second_semester_library_book_outline.second_semester_library_book_id, topic: @second_semester_library_book_outline.topic }
    end

    assert_redirected_to second_semester_library_book_outline_path(assigns(:second_semester_library_book_outline))
  end

  test "should show second_semester_library_book_outline" do
    get :show, id: @second_semester_library_book_outline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @second_semester_library_book_outline
    assert_response :success
  end

  test "should update second_semester_library_book_outline" do
    put :update, id: @second_semester_library_book_outline, second_semester_library_book_outline: { book_url: @second_semester_library_book_outline.book_url, content: @second_semester_library_book_outline.content, second_semester_library_book_id: @second_semester_library_book_outline.second_semester_library_book_id, topic: @second_semester_library_book_outline.topic }
    assert_redirected_to second_semester_library_book_outline_path(assigns(:second_semester_library_book_outline))
  end

  test "should destroy second_semester_library_book_outline" do
    assert_difference('SecondSemesterLibraryBookOutline.count', -1) do
      delete :destroy, id: @second_semester_library_book_outline
    end

    assert_redirected_to second_semester_library_book_outlines_path
  end
end
