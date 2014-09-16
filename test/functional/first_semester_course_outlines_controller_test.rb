require 'test_helper'

class FirstSemesterCourseOutlinesControllerTest < ActionController::TestCase
  setup do
    @first_semester_course_outline = first_semester_course_outlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:first_semester_course_outlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create first_semester_course_outline" do
    assert_difference('FirstSemesterCourseOutline.count') do
      post :create, first_semester_course_outline: { book_url: @first_semester_course_outline.book_url, content: @first_semester_course_outline.content, first_semester_course_id: @first_semester_course_outline.first_semester_course_id, topic: @first_semester_course_outline.topic, video_url: @first_semester_course_outline.video_url }
    end

    assert_redirected_to first_semester_course_outline_path(assigns(:first_semester_course_outline))
  end

  test "should show first_semester_course_outline" do
    get :show, id: @first_semester_course_outline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @first_semester_course_outline
    assert_response :success
  end

  test "should update first_semester_course_outline" do
    put :update, id: @first_semester_course_outline, first_semester_course_outline: { book_url: @first_semester_course_outline.book_url, content: @first_semester_course_outline.content, first_semester_course_id: @first_semester_course_outline.first_semester_course_id, topic: @first_semester_course_outline.topic, video_url: @first_semester_course_outline.video_url }
    assert_redirected_to first_semester_course_outline_path(assigns(:first_semester_course_outline))
  end

  test "should destroy first_semester_course_outline" do
    assert_difference('FirstSemesterCourseOutline.count', -1) do
      delete :destroy, id: @first_semester_course_outline
    end

    assert_redirected_to first_semester_course_outlines_path
  end
end
