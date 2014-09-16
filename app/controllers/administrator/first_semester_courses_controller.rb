class Administrator::FirstSemesterCoursesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /first_semester_courses
  # GET /first_semester_courses.json
  layout "administrator"
  def index
    @first_semester_courses = FirstSemesterCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @first_semester_courses }
    end
  end

  # GET /first_semester_courses/1
  # GET /first_semester_courses/1.json
  def show
    @first_semester_course = FirstSemesterCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @first_semester_course }
    end
  end

  # GET /first_semester_courses/new
  # GET /first_semester_courses/new.json
  def new
    @first_semester_course = FirstSemesterCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @first_semester_course }
    end
  end

  # GET /first_semester_courses/1/edit
  def edit
    @first_semester_course = FirstSemesterCourse.find(params[:id])
  end

  # POST /first_semester_courses
  # POST /first_semester_courses.json
  def create
    @first_semester_course = FirstSemesterCourse.new(params[:first_semester_course])

    respond_to do |format|
      if @first_semester_course.save
        format.html { redirect_to ([:administrator, @first_semester_course]), notice: 'First semester course was successfully created.' }
        format.json { render json: @first_semester_course, status: :created, location: @first_semester_course }
      else
        format.html { render action: "new" }
        format.json { render json: @first_semester_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /first_semester_courses/1
  # PUT /first_semester_courses/1.json
  def update
    @first_semester_course = FirstSemesterCourse.find(params[:id])

    respond_to do |format|
      if @first_semester_course.update_attributes(params[:first_semester_course])
        format.html { redirect_to ([:administrator, @first_semester_course]), notice: 'First semester course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @first_semester_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_semester_courses/1
  # DELETE /first_semester_courses/1.json
  def destroy
    @first_semester_course = FirstSemesterCourse.find(params[:id])
    @first_semester_course.destroy

    respond_to do |format|
      format.html { redirect_to administrator_first_semester_courses_url }
      format.json { head :no_content }
    end
  end

  private

  def check_admin_user_and_superadmin
    if current_user.has_role? :admin_user or current_user.has_role? :superadmin
      else
      redirect_to root_path
    end
  end

end
