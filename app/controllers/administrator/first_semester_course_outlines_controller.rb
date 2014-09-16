class Administrator::FirstSemesterCourseOutlinesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin

  layout "administrator"
  
  # GET /first_semester_course_outlines
  # GET /first_semester_course_outlines.json
  def index
    @first_semester_course_outlines = FirstSemesterCourseOutline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @first_semester_course_outlines }
    end
  end

  # GET /first_semester_course_outlines/1
  # GET /first_semester_course_outlines/1.json
  def show
    @first_semester_course_outline = FirstSemesterCourseOutline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @first_semester_course_outline }
    end
  end

  # GET /first_semester_course_outlines/new
  # GET /first_semester_course_outlines/new.json
  def new
    @first_semester_course_outline = FirstSemesterCourseOutline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @first_semester_course_outline }
    end
  end

  # GET /first_semester_course_outlines/1/edit
  def edit
    @first_semester_course_outline = FirstSemesterCourseOutline.find(params[:id])
  end

  # POST /first_semester_course_outlines
  # POST /first_semester_course_outlines.json
  def create
    @first_semester_course_outline = FirstSemesterCourseOutline.new(params[:first_semester_course_outline])

    respond_to do |format|
      if @first_semester_course_outline.save
        format.html { redirect_to ([:administrator, @first_semester_course_outline]), notice: 'First semester course outline was successfully created.' }
        format.json { render json: @first_semester_course_outline, status: :created, location: @first_semester_course_outline }
      else
        format.html { render action: "new" }
        format.json { render json: @first_semester_course_outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /first_semester_course_outlines/1
  # PUT /first_semester_course_outlines/1.json
  def update
    @first_semester_course_outline = FirstSemesterCourseOutline.find(params[:id])

    respond_to do |format|
      if @first_semester_course_outline.update_attributes(params[:first_semester_course_outline])
        format.html { redirect_to ([:administrator, @first_semester_course_outline]), notice: 'First semester course outline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @first_semester_course_outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_semester_course_outlines/1
  # DELETE /first_semester_course_outlines/1.json
  def destroy
    @first_semester_course_outline = FirstSemesterCourseOutline.find(params[:id])
    @first_semester_course_outline.destroy

    respond_to do |format|
      format.html { redirect_to administrator_first_semester_course_outlines_url }
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
