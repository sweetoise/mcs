class Administrator::InstitutionUpdatesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_ads_updates_admin_and_superadmin
  # GET /institution_updates
  # GET /institution_updates.json
  layout "administrator"
  def index
    @institution_updates = InstitutionUpdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @institution_updates }
    end
  end

  # GET /institution_updates/1
  # GET /institution_updates/1.json
  def show
    @institution_update = InstitutionUpdate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @institution_update }
    end
  end

  # GET /institution_updates/new
  # GET /institution_updates/new.json
  def new
    @institution_update = InstitutionUpdate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @institution_update }
    end
  end

  # GET /institution_updates/1/edit
  def edit
    @institution_update = InstitutionUpdate.find(params[:id])
  end

  # POST /institution_updates
  # POST /institution_updates.json
  def create
    @institution_update = InstitutionUpdate.new(params[:institution_update])

    respond_to do |format|
      if @institution_update.save
        format.html { redirect_to ([:administrator, @institution_update]), notice: 'Institution update was successfully created.' }
        format.json { render json: @institution_update, status: :created, location: @institution_update }
      else
        format.html { render action: "new" }
        format.json { render json: @institution_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /institution_updates/1
  # PUT /institution_updates/1.json
  def update
    @institution_update = InstitutionUpdate.find(params[:id])

    respond_to do |format|
      if @institution_update.update_attributes(params[:institution_update])
        format.html { redirect_to ([:administrator, @institution_update]), notice: 'Institution update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @institution_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institution_updates/1
  # DELETE /institution_updates/1.json
  def destroy
    @institution_update = InstitutionUpdate.find(params[:id])
    @institution_update.destroy

    respond_to do |format|
      format.html { redirect_to administrator_institution_updates_url }
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
