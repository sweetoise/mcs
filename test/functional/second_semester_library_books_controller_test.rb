require 'test_helper'

class SecondSemesterLibraryBooksControllerTest < ActionController::TestCase
  setup do
    @second_semester_library_book = second_semester_library_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:second_semester_library_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create second_semester_library_book" do
    assert_difference('SecondSemesterLibraryBook.count') do
      post :create, second_semester_library_book: { author: @second_semester_library_book.author, book_pages: @second_semester_library_book.book_pages, description: @second_semester_library_book.description, name: @second_semester_library_book.name, second_semester_course_id: @second_semester_library_book.second_semester_course_id }
    end

    assert_redirected_to second_semester_library_book_path(assigns(:second_semester_library_book))
  end

  test "should show second_semester_library_book" do
    get :show, id: @second_semester_library_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @second_semester_library_book
    assert_response :success
  end

  test "should update second_semester_library_book" do
    put :update, id: @second_semester_library_book, second_semester_library_book: { author: @second_semester_library_book.author, book_pages: @second_semester_library_book.book_pages, description: @second_semester_library_book.description, name: @second_semester_library_book.name, second_semester_course_id: @second_semester_library_book.second_semester_course_id }
    assert_redirected_to second_semester_library_book_path(assigns(:second_semester_library_book))
  end

  test "should destroy second_semester_library_book" do
    assert_difference('SecondSemesterLibraryBook.count', -1) do
      delete :destroy, id: @second_semester_library_book
    end

    assert_redirected_to second_semester_library_books_path
  end
end
