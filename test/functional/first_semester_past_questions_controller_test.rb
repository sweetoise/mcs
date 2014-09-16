require 'test_helper'

class FirstSemesterPastQuestionsControllerTest < ActionController::TestCase
  setup do
    @first_semester_past_question = first_semester_past_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:first_semester_past_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create first_semester_past_question" do
    assert_difference('FirstSemesterPastQuestion.count') do
      post :create, first_semester_past_question: { first_semester_course_id: @first_semester_past_question.first_semester_course_id, solution_url: @first_semester_past_question.solution_url, year: @first_semester_past_question.year }
    end

    assert_redirected_to first_semester_past_question_path(assigns(:first_semester_past_question))
  end

  test "should show first_semester_past_question" do
    get :show, id: @first_semester_past_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @first_semester_past_question
    assert_response :success
  end

  test "should update first_semester_past_question" do
    put :update, id: @first_semester_past_question, first_semester_past_question: { first_semester_course_id: @first_semester_past_question.first_semester_course_id, solution_url: @first_semester_past_question.solution_url, year: @first_semester_past_question.year }
    assert_redirected_to first_semester_past_question_path(assigns(:first_semester_past_question))
  end

  test "should destroy first_semester_past_question" do
    assert_difference('FirstSemesterPastQuestion.count', -1) do
      delete :destroy, id: @first_semester_past_question
    end

    assert_redirected_to first_semester_past_questions_path
  end
end
