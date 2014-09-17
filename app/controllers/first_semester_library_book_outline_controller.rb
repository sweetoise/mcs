class FirstSemesterLibraryBookOutlineController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user

  layout "mainpage", only: [:show]
  def show
    @library_outline = FirstSemesterLibraryBookOutline.find_by_id(params[:id])

    @library_outlines = @library_outline.first_semester_library_book.first_semester_library_book_outlines

    @limit_5 = @library_outline.first_semester_library_book.first_semester_library_book_outlines[0,5]
    @limit_6 = @library_outline.first_semester_library_book.first_semester_library_book_outlines[5,10]
    @limit_7 = @library_outline.first_semester_library_book.first_semester_library_book_outlines[10,15]
    @limit_8 = @library_outline.first_semester_library_book.first_semester_library_book_outlines[15,20]
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
