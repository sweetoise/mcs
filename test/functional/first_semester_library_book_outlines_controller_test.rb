require 'test_helper'

class FirstSemesterLibraryBookOutlinesControllerTest < ActionController::TestCase
  setup do
    @first_semester_library_book_outline = first_semester_library_book_outlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:first_semester_library_book_outlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create first_semester_library_book_outline" do
    assert_difference('FirstSemesterLibraryBookOutline.count') do
      post :create, first_semester_library_book_outline: { book_url: @first_semester_library_book_outline.book_url, content: @first_semester_library_book_outline.content, first_semester_library_book_id: @first_semester_library_book_outline.first_semester_library_book_id, topic: @first_semester_library_book_outline.topic }
    end

    assert_redirected_to first_semester_library_book_outline_path(assigns(:first_semester_library_book_outline))
  end

  test "should show first_semester_library_book_outline" do
    get :show, id: @first_semester_library_book_outline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @first_semester_library_book_outline
    assert_response :success
  end

  test "should update first_semester_library_book_outline" do
    put :update, id: @first_semester_library_book_outline, first_semester_library_book_outline: { book_url: @first_semester_library_book_outline.book_url, content: @first_semester_library_book_outline.content, first_semester_library_book_id: @first_semester_library_book_outline.first_semester_library_book_id, topic: @first_semester_library_book_outline.topic }
    assert_redirected_to first_semester_library_book_outline_path(assigns(:first_semester_library_book_outline))
  end

  test "should destroy first_semester_library_book_outline" do
    assert_difference('FirstSemesterLibraryBookOutline.count', -1) do
      delete :destroy, id: @first_semester_library_book_outline
    end

    assert_redirected_to first_semester_library_book_outlines_path
  end
end
