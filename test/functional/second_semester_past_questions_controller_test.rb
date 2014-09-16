require 'test_helper'

class SecondSemesterPastQuestionsControllerTest < ActionController::TestCase
  setup do
    @second_semester_past_question = second_semester_past_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:second_semester_past_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create second_semester_past_question" do
    assert_difference('SecondSemesterPastQuestion.count') do
      post :create, second_semester_past_question: { second_semester_course_id: @second_semester_past_question.second_semester_course_id, solution_url: @second_semester_past_question.solution_url, year: @second_semester_past_question.year }
    end

    assert_redirected_to second_semester_past_question_path(assigns(:second_semester_past_question))
  end

  test "should show second_semester_past_question" do
    get :show, id: @second_semester_past_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @second_semester_past_question
    assert_response :success
  end

  test "should update second_semester_past_question" do
    put :update, id: @second_semester_past_question, second_semester_past_question: { second_semester_course_id: @second_semester_past_question.second_semester_course_id, solution_url: @second_semester_past_question.solution_url, year: @second_semester_past_question.year }
    assert_redirected_to second_semester_past_question_path(assigns(:second_semester_past_question))
  end

  test "should destroy second_semester_past_question" do
    assert_difference('SecondSemesterPastQuestion.count', -1) do
      delete :destroy, id: @second_semester_past_question
    end

    assert_redirected_to second_semester_past_questions_path
  end
end
