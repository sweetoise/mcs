class Administrator::SecondSemesterCourseOutlinesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin

  layout "administrator"
  # GET /second_semester_course_outlines
  # GET /second_semester_course_outlines.json
  def index
    @second_semester_course_outlines = SecondSemesterCourseOutline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @second_semester_course_outlines }
    end
  end

  # GET /second_semester_course_outlines/1
  # GET /second_semester_course_outlines/1.json
  def show
    @second_semester_course_outline = SecondSemesterCourseOutline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @second_semester_course_outline }
    end
  end

  # GET /second_semester_course_outlines/new
  # GET /second_semester_course_outlines/new.json
  def new
    @second_semester_course_outline = SecondSemesterCourseOutline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @second_semester_course_outline }
    end
  end

  # GET /second_semester_course_outlines/1/edit
  def edit
    @second_semester_course_outline = SecondSemesterCourseOutline.find(params[:id])
  end

  # POST /second_semester_course_outlines
  # POST /second_semester_course_outlines.json
  def create
    @second_semester_course_outline = SecondSemesterCourseOutline.new(params[:second_semester_course_outline])

    respond_to do |format|
      if @second_semester_course_outline.save
        format.html { redirect_to ([:administrator, @second_semester_course_outline]), notice: 'Second semester course outline was successfully created.' }
        format.json { render json: @second_semester_course_outline, status: :created, location: @second_semester_course_outline }
      else
        format.html { render action: "new" }
        format.json { render json: @second_semester_course_outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /second_semester_course_outlines/1
  # PUT /second_semester_course_outlines/1.json
  def update
    @second_semester_course_outline = SecondSemesterCourseOutline.find(params[:id])

    respond_to do |format|
      if @second_semester_course_outline.update_attributes(params[:second_semester_course_outline])
        format.html { redirect_to ([:administrator, @second_semester_course_outline]), notice: 'Second semester course outline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @second_semester_course_outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /second_semester_course_outlines/1
  # DELETE /second_semester_course_outlines/1.json
  def destroy
    @second_semester_course_outline = SecondSemesterCourseOutline.find(params[:id])
    @second_semester_course_outline.destroy

    respond_to do |format|
      format.html { redirect_to administrator_second_semester_course_outlines_url }
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
