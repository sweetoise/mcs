class UserSecondSemesterCourseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user

  layout "mainpage", only: [:show]
  def index
  end

  def show
    @second_semester_course = SecondSemesterCourse.find_by_id(params[:id])

    if @second_semester_course
      User.where(:id => current_user.id).update_all(:second_semester_course_id => @second_semester_course, :selected_course => 'second')
      current_user.save
    end

  end
  
   private

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
