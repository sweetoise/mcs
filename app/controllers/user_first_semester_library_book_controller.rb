class UserFirstSemesterLibraryBookController < ApplicationController
  before_filter :check_superadmin
  before_filter :only_allow_user

  layout "mainpage", only: [:show]
  def show
    @library_books = FirstSemesterLibraryBook.all
    @library_book = FirstSemesterLibraryBook.find_by_id(params[:id])

    if @library_book
      User.where(:id => current_user.id).update_all(:first_semester_course_id => @library_book.first_semester_course_id, :selected_course => 'first')
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
