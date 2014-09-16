class TermsOfUsesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /terms_of_uses
  # GET /terms_of_uses.json
  layout "administrator"
  def index
    @terms_of_uses = TermsOfUse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terms_of_uses }
    end
  end

  # GET /terms_of_uses/1
  # GET /terms_of_uses/1.json
  def show
    @terms_of_use = TermsOfUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @terms_of_use }
    end
  end

  # GET /terms_of_uses/new
  # GET /terms_of_uses/new.json
  def new
    @terms_of_use = TermsOfUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @terms_of_use }
    end
  end

  # GET /terms_of_uses/1/edit
  def edit
    @terms_of_use = TermsOfUse.find(params[:id])
  end

  # POST /terms_of_uses
  # POST /terms_of_uses.json
  def create
    @terms_of_use = TermsOfUse.new(params[:terms_of_use])

    respond_to do |format|
      if @terms_of_use.save
        format.html { redirect_to @terms_of_use, notice: 'Terms of use was successfully created.' }
        format.json { render json: @terms_of_use, status: :created, location: @terms_of_use }
      else
        format.html { render action: "new" }
        format.json { render json: @terms_of_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /terms_of_uses/1
  # PUT /terms_of_uses/1.json
  def update
    @terms_of_use = TermsOfUse.find(params[:id])

    respond_to do |format|
      if @terms_of_use.update_attributes(params[:terms_of_use])
        format.html { redirect_to @terms_of_use, notice: 'Terms of use was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @terms_of_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terms_of_uses/1
  # DELETE /terms_of_uses/1.json
  def destroy
    @terms_of_use = TermsOfUse.find(params[:id])
    @terms_of_use.destroy

    respond_to do |format|
      format.html { redirect_to terms_of_uses_url }
      format.json { head :no_content }
    end
  end
  
  
  private
  
  
  def check_admin_user_and_superadmin
    if current_user.has_role? :superadmin
    else
      redirect_to root_path
    end
  end
end
