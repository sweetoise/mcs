class Administrator::FacultyUpdatesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_ads_updates_admin_and_superadmin
  # GET /faculty_updates
  # GET /faculty_updates.json
  layout "administrator"
  def index
    @faculty_updates = FacultyUpdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faculty_updates }
    end
  end

  # GET /faculty_updates/1
  # GET /faculty_updates/1.json
  def show
    @faculty_update = FacultyUpdate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faculty_update }
    end
  end

  # GET /faculty_updates/new
  # GET /faculty_updates/new.json
  def new
    @faculty_update = FacultyUpdate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faculty_update }
    end
  end

  # GET /faculty_updates/1/edit
  def edit
    @faculty_update = FacultyUpdate.find(params[:id])
  end

  # POST /faculty_updates
  # POST /faculty_updates.json
  def create
    @faculty_update = FacultyUpdate.new(params[:faculty_update])

    respond_to do |format|
      if @faculty_update.save
        format.html { redirect_to ([:administrator, @faculty_update]), notice: 'Faculty update was successfully created.' }
        format.json { render json: @faculty_update, status: :created, location: @faculty_update }
      else
        format.html { render action: "new" }
        format.json { render json: @faculty_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faculty_updates/1
  # PUT /faculty_updates/1.json
  def update
    @faculty_update = FacultyUpdate.find(params[:id])

    respond_to do |format|
      if @faculty_update.update_attributes(params[:faculty_update])
        format.html { redirect_to ([:administrator, @faculty_update]), notice: 'Faculty update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faculty_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculty_updates/1
  # DELETE /faculty_updates/1.json
  def destroy
    @faculty_update = FacultyUpdate.find(params[:id])
    @faculty_update.destroy

    respond_to do |format|
      format.html { redirect_to administrator_faculty_updates_url }
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
