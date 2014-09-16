class CopywriteTermsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /copywrite_terms
  # GET /copywrite_terms.json
  layout "administrator"
  def index
    @copywrite_terms = CopywriteTerm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @copywrite_terms }
    end
  end

  # GET /copywrite_terms/1
  # GET /copywrite_terms/1.json
  def show
    @copywrite_term = CopywriteTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @copywrite_term }
    end
  end

  # GET /copywrite_terms/new
  # GET /copywrite_terms/new.json
  def new
    @copywrite_term = CopywriteTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @copywrite_term }
    end
  end

  # GET /copywrite_terms/1/edit
  def edit
    @copywrite_term = CopywriteTerm.find(params[:id])
  end

  # POST /copywrite_terms
  # POST /copywrite_terms.json
  def create
    @copywrite_term = CopywriteTerm.new(params[:copywrite_term])

    respond_to do |format|
      if @copywrite_term.save
        format.html { redirect_to @copywrite_term, notice: 'Copywrite term was successfully created.' }
        format.json { render json: @copywrite_term, status: :created, location: @copywrite_term }
      else
        format.html { render action: "new" }
        format.json { render json: @copywrite_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /copywrite_terms/1
  # PUT /copywrite_terms/1.json
  def update
    @copywrite_term = CopywriteTerm.find(params[:id])

    respond_to do |format|
      if @copywrite_term.update_attributes(params[:copywrite_term])
        format.html { redirect_to @copywrite_term, notice: 'Copywrite term was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @copywrite_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /copywrite_terms/1
  # DELETE /copywrite_terms/1.json
  def destroy
    @copywrite_term = CopywriteTerm.find(params[:id])
    @copywrite_term.destroy

    respond_to do |format|
      format.html { redirect_to copywrite_terms_url }
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
