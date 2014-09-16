class PrivacyTermsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /privacy_terms
  # GET /privacy_terms.json
  layout "administrator"
  def index
    @privacy_terms = PrivacyTerm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @privacy_terms }
    end
  end

  # GET /privacy_terms/1
  # GET /privacy_terms/1.json
  def show
    @privacy_term = PrivacyTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @privacy_term }
    end
  end

  # GET /privacy_terms/new
  # GET /privacy_terms/new.json
  def new
    @privacy_term = PrivacyTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @privacy_term }
    end
  end

  # GET /privacy_terms/1/edit
  def edit
    @privacy_term = PrivacyTerm.find(params[:id])
  end

  # POST /privacy_terms
  # POST /privacy_terms.json
  def create
    @privacy_term = PrivacyTerm.new(params[:privacy_term])

    respond_to do |format|
      if @privacy_term.save
        format.html { redirect_to @privacy_term, notice: 'Privacy term was successfully created.' }
        format.json { render json: @privacy_term, status: :created, location: @privacy_term }
      else
        format.html { render action: "new" }
        format.json { render json: @privacy_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /privacy_terms/1
  # PUT /privacy_terms/1.json
  def update
    @privacy_term = PrivacyTerm.find(params[:id])

    respond_to do |format|
      if @privacy_term.update_attributes(params[:privacy_term])
        format.html { redirect_to @privacy_term, notice: 'Privacy term was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @privacy_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privacy_terms/1
  # DELETE /privacy_terms/1.json
  def destroy
    @privacy_term = PrivacyTerm.find(params[:id])
    @privacy_term.destroy

    respond_to do |format|
      format.html { redirect_to privacy_terms_url }
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
