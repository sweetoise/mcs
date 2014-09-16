class Administrator::DepartmentNoticesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_ads_updates_admin_and_superadmin
  # GET /department_notices
  # GET /department_notices.json
  layout "administrator"
  def index
    @department_notices = DepartmentNotice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @department_notices }
    end
  end

  # GET /department_notices/1
  # GET /department_notices/1.json
  def show
    @department_notice = DepartmentNotice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department_notice }
    end
  end

  # GET /department_notices/new
  # GET /department_notices/new.json
  def new
    @department_notice = DepartmentNotice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @department_notice }
    end
  end

  # GET /department_notices/1/edit
  def edit
    @department_notice = DepartmentNotice.find(params[:id])
  end

  # POST /department_notices
  # POST /department_notices.json
  def create
    @department_notice = DepartmentNotice.new(params[:department_notice])

    respond_to do |format|
      if @department_notice.save
        format.html { redirect_to ([:administrator, @department_notice]), notice: 'Department notice was successfully created.' }
        format.json { render json: @department_notice, status: :created, location: @department_notice }
      else
        format.html { render action: "new" }
        format.json { render json: @department_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /department_notices/1
  # PUT /department_notices/1.json
  def update
    @department_notice = DepartmentNotice.find(params[:id])

    respond_to do |format|
      if @department_notice.update_attributes(params[:department_notice])
        format.html { redirect_to ([:administrator, @department_notice]), notice: 'Department notice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @department_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department_notices/1
  # DELETE /department_notices/1.json
  def destroy
    @department_notice = DepartmentNotice.find(params[:id])
    @department_notice.destroy

    respond_to do |format|
      format.html { redirect_to administrator_department_notices_url }
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
