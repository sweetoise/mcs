require 'test_helper'

class SecondSemesterCourseOutlinesControllerTest < ActionController::TestCase
  setup do
    @second_semester_course_outline = second_semester_course_outlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:second_semester_course_outlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create second_semester_course_outline" do
    assert_difference('SecondSemesterCourseOutline.count') do
      post :create, second_semester_course_outline: { book_url: @second_semester_course_outline.book_url, content: @second_semester_course_outline.content, second_semester_course_id: @second_semester_course_outline.second_semester_course_id, topic: @second_semester_course_outline.topic, video_url: @second_semester_course_outline.video_url }
    end

    assert_redirected_to second_semester_course_outline_path(assigns(:second_semester_course_outline))
  end

  test "should show second_semester_course_outline" do
    get :show, id: @second_semester_course_outline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @second_semester_course_outline
    assert_response :success
  end

  test "should update second_semester_course_outline" do
    put :update, id: @second_semester_course_outline, second_semester_course_outline: { book_url: @second_semester_course_outline.book_url, content: @second_semester_course_outline.content, second_semester_course_id: @second_semester_course_outline.second_semester_course_id, topic: @second_semester_course_outline.topic, video_url: @second_semester_course_outline.video_url }
    assert_redirected_to second_semester_course_outline_path(assigns(:second_semester_course_outline))
  end

  test "should destroy second_semester_course_outline" do
    assert_difference('SecondSemesterCourseOutline.count', -1) do
      delete :destroy, id: @second_semester_course_outline
    end

    assert_redirected_to second_semester_course_outlines_path
  end
end
