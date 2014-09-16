class UpdateSemesterCourseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :update_semester_course!
  before_filter :check_superadmin
  before_filter :only_allow_user
  
  
  def show
  end

  private

  def update_semester_course!
    @first_library_book = FirstSemesterLibraryBook.find_by_id(params[:id])
    @first_library_books = FirstSemesterLibraryBook.all

    if @first_library_book
      User.where(:id => current_user.id).update_all(:first_semester_course_id => @first_library_book.first_semester_course_id, :selected_course => 'first')
      current_user.save
      redirect_to :controller => 'user_first_semester_library_book', :action => 'show', :id => @first_library_book
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
