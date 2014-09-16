class Administrator::InstitutionNoticesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_ads_updates_admin_and_superadmin
  # GET /institution_notices
  # GET /institution_notices.json
  layout "administrator"
  def index
    @institution_notices = InstitutionNotice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @institution_notices }
    end
  end

  # GET /institution_notices/1
  # GET /institution_notices/1.json
  def show
    @institution_notice = InstitutionNotice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @institution_notice }
    end
  end

  # GET /institution_notices/new
  # GET /institution_notices/new.json
  def new
    @institution_notice = InstitutionNotice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @institution_notice }
    end
  end

  # GET /institution_notices/1/edit
  def edit
    @institution_notice = InstitutionNotice.find(params[:id])
  end

  # POST /institution_notices
  # POST /institution_notices.json
  def create
    @institution_notice = InstitutionNotice.new(params[:institution_notice])

    respond_to do |format|
      if @institution_notice.save
        format.html { redirect_to ([:administrator, @institution_notice]), notice: 'Institution notice was successfully created.' }
        format.json { render json: @institution_notice, status: :created, location: @institution_notice }
      else
        format.html { render action: "new" }
        format.json { render json: @institution_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /institution_notices/1
  # PUT /institution_notices/1.json
  def update
    @institution_notice = InstitutionNotice.find(params[:id])

    respond_to do |format|
      if @institution_notice.update_attributes(params[:institution_notice])
        format.html { redirect_to ([:administrator, @institution_notice]), notice: 'Institution notice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @institution_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institution_notices/1
  # DELETE /institution_notices/1.json
  def destroy
    @institution_notice = InstitutionNotice.find(params[:id])
    @institution_notice.destroy

    respond_to do |format|
      format.html { redirect_to administrator_institution_notices_url }
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
