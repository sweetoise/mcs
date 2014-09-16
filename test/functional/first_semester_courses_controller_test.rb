require 'test_helper'

class FirstSemesterCoursesControllerTest < ActionController::TestCase
  setup do
    @first_semester_course = first_semester_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:first_semester_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create first_semester_course" do
    assert_difference('FirstSemesterCourse.count') do
      post :create, first_semester_course: { code: @first_semester_course.code, content: @first_semester_course.content, course_type_id: @first_semester_course.course_type_id, credit_load: @first_semester_course.credit_load, description: @first_semester_course.description, level_id: @first_semester_course.level_id, semester_id: @first_semester_course.semester_id, title: @first_semester_course.title }
    end

    assert_redirected_to first_semester_course_path(assigns(:first_semester_course))
  end

  test "should show first_semester_course" do
    get :show, id: @first_semester_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @first_semester_course
    assert_response :success
  end

  test "should update first_semester_course" do
    put :update, id: @first_semester_course, first_semester_course: { code: @first_semester_course.code, content: @first_semester_course.content, course_type_id: @first_semester_course.course_type_id, credit_load: @first_semester_course.credit_load, description: @first_semester_course.description, level_id: @first_semester_course.level_id, semester_id: @first_semester_course.semester_id, title: @first_semester_course.title }
    assert_redirected_to first_semester_course_path(assigns(:first_semester_course))
  end

  test "should destroy first_semester_course" do
    assert_difference('FirstSemesterCourse.count', -1) do
      delete :destroy, id: @first_semester_course
    end

    assert_redirected_to first_semester_courses_path
  end
end
