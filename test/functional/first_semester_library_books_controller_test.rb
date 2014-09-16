require 'test_helper'

class FirstSemesterLibraryBooksControllerTest < ActionController::TestCase
  setup do
    @first_semester_library_book = first_semester_library_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:first_semester_library_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create first_semester_library_book" do
    assert_difference('FirstSemesterLibraryBook.count') do
      post :create, first_semester_library_book: { author: @first_semester_library_book.author, book_pages: @first_semester_library_book.book_pages, description: @first_semester_library_book.description, first_semester_course_id: @first_semester_library_book.first_semester_course_id, name: @first_semester_library_book.name }
    end

    assert_redirected_to first_semester_library_book_path(assigns(:first_semester_library_book))
  end

  test "should show first_semester_library_book" do
    get :show, id: @first_semester_library_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @first_semester_library_book
    assert_response :success
  end

  test "should update first_semester_library_book" do
    put :update, id: @first_semester_library_book, first_semester_library_book: { author: @first_semester_library_book.author, book_pages: @first_semester_library_book.book_pages, description: @first_semester_library_book.description, first_semester_course_id: @first_semester_library_book.first_semester_course_id, name: @first_semester_library_book.name }
    assert_redirected_to first_semester_library_book_path(assigns(:first_semester_library_book))
  end

  test "should destroy first_semester_library_book" do
    assert_difference('FirstSemesterLibraryBook.count', -1) do
      delete :destroy, id: @first_semester_library_book
    end

    assert_redirected_to first_semester_library_books_path
  end
end
