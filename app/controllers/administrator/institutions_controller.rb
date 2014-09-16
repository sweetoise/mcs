class Administrator::InstitutionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /institutions
  # GET /institutions.json
  layout "administrator"
  # GET /institutions
  # GET /institutions.json
  def index
    @institutions = Institution.all
  end

  def show
    @institution = Institution.find(params[:id])
  end

  def new
    @institution = Institution.new
  end

  # GET /institutions/1/edit
  def edit
    @institution = Institution.find(params[:id])
  end

  def create
    @institution = Institution.new(params[:institution])

    if @institution.save
      redirect_to ([:administrator, @institution]), notice: 'Institution was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @institution = Institution.find(params[:id])

    if @institution.update_attributes(params[:institution])
      redirect_to ([:administrator, @institution]), notice: 'Institution was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy

    redirect_to administrator_institutions_url
  end

  private

  def check_admin_user_and_superadmin
    if current_user.has_role? :admin_user or current_user.has_role? :superadmin
      else
      redirect_to root_path
    end
  end
end
