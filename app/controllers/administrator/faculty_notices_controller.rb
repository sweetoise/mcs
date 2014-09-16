class Administrator::FacultyNoticesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_ads_updates_admin_and_superadmin
  # GET /faculty_notices
  # GET /faculty_notices.json
  layout "administrator"
  def index
    @faculty_notices = FacultyNotice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faculty_notices }
    end
  end

  # GET /faculty_notices/1
  # GET /faculty_notices/1.json
  def show
    @faculty_notice = FacultyNotice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faculty_notice }
    end
  end

  # GET /faculty_notices/new
  # GET /faculty_notices/new.json
  def new
    @faculty_notice = FacultyNotice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faculty_notice }
    end
  end

  # GET /faculty_notices/1/edit
  def edit
    @faculty_notice = FacultyNotice.find(params[:id])
  end

  # POST /faculty_notices
  # POST /faculty_notices.json
  def create
    @faculty_notice = FacultyNotice.new(params[:faculty_notice])

    respond_to do |format|
      if @faculty_notice.save
        format.html { redirect_to ([:administrator, @faculty_notice]), notice: 'Faculty notice was successfully created.' }
        format.json { render json: @faculty_notice, status: :created, location: @faculty_notice }
      else
        format.html { render action: "new" }
        format.json { render json: @faculty_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faculty_notices/1
  # PUT /faculty_notices/1.json
  def update
    @faculty_notice = FacultyNotice.find(params[:id])

    respond_to do |format|
      if @faculty_notice.update_attributes(params[:faculty_notice])
        format.html { redirect_to ([:administrator, @faculty_notice]), notice: 'Faculty notice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faculty_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculty_notices/1
  # DELETE /faculty_notices/1.json
  def destroy
    @faculty_notice = FacultyNotice.find(params[:id])
    @faculty_notice.destroy

    respond_to do |format|
      format.html { redirect_to administrator_faculty_notices_url }
      format.json { head :no_content }
    end
  end

  private

  def check_ads_updates_admin_and_superadmin
    if current_user.has_role? :ads_updates_admin or current_user.has_role? :superadmin or current_user.has_role? :admin_user
      else
      redirect_to root_path
    end
  end
end
