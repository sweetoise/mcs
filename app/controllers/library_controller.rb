class LibraryController < ApplicationController
  layout "mainpage", only: [:books]
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  def books
    @first_semester_library_book = FirstSemesterLibraryBook.find_by_id(params[:id])
  end

  private

  def check_superadmin
    if current_user.has_role? :superadmin
      redirect_to :controller => 'superadmin/panel', :action => 'index'
    end
  end

  def only_allow_user
    if current_user.has_role? :user
      if current_user.institution == nil or current_user.faculty == nil or current_user.department == nil or current_user.level == nil
        redirect_to :controller => 'listings', :action => 'edit'
      else
        render 'books'
      end
    else redirect_to root_path
    end
  end
end
