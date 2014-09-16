class Administrator::FirstSemesterLibraryBooksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /first_semester_library_books
  # GET /first_semester_library_books.json
  
  layout "administrator"
  def index
    @first_semester_library_books = FirstSemesterLibraryBook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @first_semester_library_books }
    end
  end

  # GET /first_semester_library_books/1
  # GET /first_semester_library_books/1.json
  def show
    @first_semester_library_book = FirstSemesterLibraryBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @first_semester_library_book }
    end
  end

  # GET /first_semester_library_books/new
  # GET /first_semester_library_books/new.json
  def new
    @first_semester_library_book = FirstSemesterLibraryBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @first_semester_library_book }
    end
  end

  # GET /first_semester_library_books/1/edit
  def edit
    @first_semester_library_book = FirstSemesterLibraryBook.find(params[:id])
  end

  # POST /first_semester_library_books
  # POST /first_semester_library_books.json
  def create
    @first_semester_library_book = FirstSemesterLibraryBook.new(params[:first_semester_library_book])

    respond_to do |format|
      if @first_semester_library_book.save
        format.html { redirect_to ([:administrator, @first_semester_library_book]), notice: 'First semester library book was successfully created.' }
        format.json { render json: @first_semester_library_book, status: :created, location: @first_semester_library_book }
      else
        format.html { render action: "new" }
        format.json { render json: @first_semester_library_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /first_semester_library_books/1
  # PUT /first_semester_library_books/1.json
  def update
    @first_semester_library_book = FirstSemesterLibraryBook.find(params[:id])

    respond_to do |format|
      if @first_semester_library_book.update_attributes(params[:first_semester_library_book])
        format.html { redirect_to ([:administrator, @first_semester_library_book]), notice: 'First semester library book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @first_semester_library_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_semester_library_books/1
  # DELETE /first_semester_library_books/1.json
  def destroy
    @first_semester_library_book = FirstSemesterLibraryBook.find(params[:id])
    @first_semester_library_book.destroy

    respond_to do |format|
      format.html { redirect_to administrator_first_semester_library_books_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def check_admin_user_and_superadmin
    if current_user.has_role? :admin_user or current_user.has_role? :superadmin or current_user.has_role? :past_questions_admin or current_user.has_role? :library_admin or current_user.has_role? :class_note_admin
    else
      redirect_to root_path
    end
  end
end
