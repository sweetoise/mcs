class FirstSemesterCourseOutlineController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  before_filter :check_expiry

  layout "mainpage", only: [:show]
  def show
    @course_outline = FirstSemesterCourseOutline.find_by_id(params[:id])

    @course_outlines = @course_outline.first_semester_course.first_semester_course_outlines

    @limit_5  = @course_outline.first_semester_course.first_semester_course_outlines[0,5]
    @limit_6  = @course_outline.first_semester_course.first_semester_course_outlines[5,10]
    @limit_7  = @course_outline.first_semester_course.first_semester_course_outlines[10, 15]
    @limit_8  = @course_outline.first_semester_course.first_semester_course_outlines[15,20]
  end

  private

  def check_expiry
    if current_user.expiration == nil
      redirect_to :controller => 'account', :action => 'expired_subscription'
    else
      if (current_user.expiration - Time.current).to_i <= 0
        redirect_to :controller => 'account', :action => 'expired_subscription'
      end
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
