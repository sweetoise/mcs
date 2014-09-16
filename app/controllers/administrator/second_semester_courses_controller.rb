class Administrator::SecondSemesterCoursesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /second_semester_courses
  # GET /second_semester_courses.json
  
  layout "administrator"
  def index
    @second_semester_courses = SecondSemesterCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @second_semester_courses }
    end
  end

  # GET /second_semester_courses/1
  # GET /second_semester_courses/1.json
  def show
    @second_semester_course = SecondSemesterCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @second_semester_course }
    end
  end

  # GET /second_semester_courses/new
  # GET /second_semester_courses/new.json
  def new
    @second_semester_course = SecondSemesterCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @second_semester_course }
    end
  end

  # GET /second_semester_courses/1/edit
  def edit
    @second_semester_course = SecondSemesterCourse.find(params[:id])
  end

  # POST /second_semester_courses
  # POST /second_semester_courses.json
  def create
    @second_semester_course = SecondSemesterCourse.new(params[:second_semester_course])

    respond_to do |format|
      if @second_semester_course.save
        format.html { redirect_to ([:administrator, @second_semester_course]), notice: 'Second semester course was successfully created.' }
        format.json { render json: @second_semester_course, status: :created, location: @second_semester_course }
      else
        format.html { render action: "new" }
        format.json { render json: @second_semester_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /second_semester_courses/1
  # PUT /second_semester_courses/1.json
  def update
    @second_semester_course = SecondSemesterCourse.find(params[:id])

    respond_to do |format|
      if @second_semester_course.update_attributes(params[:second_semester_course])
        format.html { redirect_to ([:administrator, @second_semester_course]), notice: 'Second semester course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @second_semester_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /second_semester_courses/1
  # DELETE /second_semester_courses/1.json
  def destroy
    @second_semester_course = SecondSemesterCourse.find(params[:id])
    @second_semester_course.destroy

    respond_to do |format|
      format.html { redirect_to administrator_second_semester_courses_url }
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
