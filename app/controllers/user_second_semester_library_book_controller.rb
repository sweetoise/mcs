class UserSecondSemesterLibraryBookController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  
  
  
  layout "mainpage", only: [:show]
  def show
    @library_books = SecondSemesterLibraryBook.all
    @library_book = SecondSemesterLibraryBook.find_by_id(params[:id])

    if @library_book
      User.where(:id => current_user.id).update_all(:second_semester_course_id => @library_book.second_semester_course_id, :selected_course => 'second')
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
