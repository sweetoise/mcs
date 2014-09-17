class SecondUpdateSemesterCourseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  before_filter :update_semester_course!
  def show
  end

  private

  def update_semester_course!
    @second_library_book = SecondSemesterLibraryBook.find_by_id(params[:id])
    @second_library_books = SecondSemesterLibraryBook.all

    if @second_library_book
      User.where(:id => current_user.id).update_all(:second_semester_course_id => @second_library_book.second_semester_course_id, :selected_course => 'second')
      current_user.save
      redirect_to :controller => 'user_second_semester_library_book', :action => 'show', :id => @second_library_book
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
