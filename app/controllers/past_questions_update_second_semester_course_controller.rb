class PastQuestionsUpdateSecondSemesterCourseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  before_filter :update_second_semester_course!
  def show
  end

  private

  def update_second_semester_course!
    @second_semester_past_question = SecondSemesterPastQuestion.find_by_id(params[:id])

    if @second_semester_past_question
      User.where(:id => current_user.id).update_all(:second_semester_course_id => @second_semester_past_question.second_semester_course_id, :selected_course => 'second')
      current_user.save
      redirect_to :controller => 'second_semester_questions_and_solutions', :action => 'show', :id => @second_semester_past_question
    end
  end

  def check_superadmin
    if current_user.has_role? :superadmin
      redirect_to :controller => 'superadmin/panel', :action => 'index'
    end
  end

  def only_allow_user
    if current_user.has_role? :user
      else
      redirect_to root_path
    end
  end
end
