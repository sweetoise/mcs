class Administrator::DepartmentUpdatesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_ads_updates_admin_and_superadmin
  # GET /department_updates
  # GET /department_updates.json
  layout "administrator"
  def index
    @department_updates = DepartmentUpdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @department_updates }
    end
  end

  # GET /department_updates/1
  # GET /department_updates/1.json
  def show
    @department_update = DepartmentUpdate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department_update }
    end
  end

  # GET /department_updates/new
  # GET /department_updates/new.json
  def new
    @department_update = DepartmentUpdate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @department_update }
    end
  end

  # GET /department_updates/1/edit
  def edit
    @department_update = DepartmentUpdate.find(params[:id])
  end

  # POST /department_updates
  # POST /department_updates.json
  def create
    @department_update = DepartmentUpdate.new(params[:department_update])

    respond_to do |format|
      if @department_update.save
        format.html { redirect_to ([:administrator, @department_update]), notice: 'Department update was successfully created.' }
        format.json { render json: @department_update, status: :created, location: @department_update }
      else
        format.html { render action: "new" }
        format.json { render json: @department_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /department_updates/1
  # PUT /department_updates/1.json
  def update
    @department_update = DepartmentUpdate.find(params[:id])

    respond_to do |format|
      if @department_update.update_attributes(params[:department_update])
        format.html { redirect_to ([:administrator, @department_update]), notice: 'Department update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @department_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department_updates/1
  # DELETE /department_updates/1.json
  def destroy
    @department_update = DepartmentUpdate.find(params[:id])
    @department_update.destroy

    respond_to do |format|
      format.html { redirect_to administrator_department_updates_url }
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
