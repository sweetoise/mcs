class Administrator::FirstSemesterPastQuestionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /first_semester_past_questions
  # GET /first_semester_past_questions.json
  layout "administrator"
  def index
    @first_semester_past_questions = FirstSemesterPastQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @first_semester_past_questions }
    end
  end

  # GET /first_semester_past_questions/1
  # GET /first_semester_past_questions/1.json
  def show
    @first_semester_past_question = FirstSemesterPastQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @first_semester_past_question }
    end
  end

  # GET /first_semester_past_questions/new
  # GET /first_semester_past_questions/new.json
  def new
    @first_semester_past_question = FirstSemesterPastQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @first_semester_past_question }
    end
  end

  # GET /first_semester_past_questions/1/edit
  def edit
    @first_semester_past_question = FirstSemesterPastQuestion.find(params[:id])
  end

  # POST /first_semester_past_questions
  # POST /first_semester_past_questions.json
  def create
    @first_semester_past_question = FirstSemesterPastQuestion.new(params[:first_semester_past_question])

    respond_to do |format|
      if @first_semester_past_question.save
        format.html { redirect_to ([:administrator, @first_semester_past_question]), notice: 'First semester past question was successfully created.' }
        format.json { render json: @first_semester_past_question, status: :created, location: @first_semester_past_question }
      else
        format.html { render action: "new" }
        format.json { render json: @first_semester_past_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /first_semester_past_questions/1
  # PUT /first_semester_past_questions/1.json
  def update
    @first_semester_past_question = FirstSemesterPastQuestion.find(params[:id])

    respond_to do |format|
      if @first_semester_past_question.update_attributes(params[:first_semester_past_question])
        format.html { redirect_to ([:administrator, @first_semester_past_question]), notice: 'First semester past question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @first_semester_past_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_semester_past_questions/1
  # DELETE /first_semester_past_questions/1.json
  def destroy
    @first_semester_past_question = FirstSemesterPastQuestion.find(params[:id])
    @first_semester_past_question.destroy

    respond_to do |format|
      format.html { redirect_to administrator_first_semester_past_questions_url }
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
