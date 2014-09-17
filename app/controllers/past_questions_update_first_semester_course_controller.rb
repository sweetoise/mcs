class PastQuestionsUpdateFirstSemesterCourseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  before_filter :update_first_semester_course!
 
  def show
  end
  
  private

  def update_first_semester_course!
    @first_semester_past_question = FirstSemesterPastQuestion.find_by_id(params[:id])

    if @first_semester_past_question
      User.where(:id => current_user.id).update_all(:first_semester_course_id => @first_semester_past_question.first_semester_course_id, :selected_course => 'first')
      current_user.save
      redirect_to :controller => 'first_semester_questions_and_solutions', :action => 'show', :id => @first_semester_past_question
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
