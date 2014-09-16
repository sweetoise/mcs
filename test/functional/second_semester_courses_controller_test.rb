require 'test_helper'

class SecondSemesterCoursesControllerTest < ActionController::TestCase
  setup do
    @second_semester_course = second_semester_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:second_semester_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create second_semester_course" do
    assert_difference('SecondSemesterCourse.count') do
      post :create, second_semester_course: { code: @second_semester_course.code, content: @second_semester_course.content, course_type_id: @second_semester_course.course_type_id, credit_load: @second_semester_course.credit_load, description: @second_semester_course.description, level_id: @second_semester_course.level_id, semester_id: @second_semester_course.semester_id, title: @second_semester_course.title }
    end

    assert_redirected_to second_semester_course_path(assigns(:second_semester_course))
  end

  test "should show second_semester_course" do
    get :show, id: @second_semester_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @second_semester_course
    assert_response :success
  end

  test "should update second_semester_course" do
    put :update, id: @second_semester_course, second_semester_course: { code: @second_semester_course.code, content: @second_semester_course.content, course_type_id: @second_semester_course.course_type_id, credit_load: @second_semester_course.credit_load, description: @second_semester_course.description, level_id: @second_semester_course.level_id, semester_id: @second_semester_course.semester_id, title: @second_semester_course.title }
    assert_redirected_to second_semester_course_path(assigns(:second_semester_course))
  end

  test "should destroy second_semester_course" do
    assert_difference('SecondSemesterCourse.count', -1) do
      delete :destroy, id: @second_semester_course
    end

    assert_redirected_to second_semester_courses_path
  end
end
