class StateOfOriginsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  # GET /state_of_origins
  # GET /state_of_origins.json
  layout "administrator"
  def index
    @state_of_origins = StateOfOrigin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @state_of_origins }
    end
  end

  # GET /state_of_origins/1
  # GET /state_of_origins/1.json
  def show
    @state_of_origin = StateOfOrigin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @state_of_origin }
    end
  end

  # GET /state_of_origins/new
  # GET /state_of_origins/new.json
  def new
    @state_of_origin = StateOfOrigin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @state_of_origin }
    end
  end

  # GET /state_of_origins/1/edit
  def edit
    @state_of_origin = StateOfOrigin.find(params[:id])
  end

  # POST /state_of_origins
  # POST /state_of_origins.json
  def create
    @state_of_origin = StateOfOrigin.new(params[:state_of_origin])

    respond_to do |format|
      if @state_of_origin.save
        format.html { redirect_to @state_of_origin, notice: 'State of origin was successfully created.' }
        format.json { render json: @state_of_origin, status: :created, location: @state_of_origin }
      else
        format.html { render action: "new" }
        format.json { render json: @state_of_origin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /state_of_origins/1
  # PUT /state_of_origins/1.json
  def update
    @state_of_origin = StateOfOrigin.find(params[:id])

    respond_to do |format|
      if @state_of_origin.update_attributes(params[:state_of_origin])
        format.html { redirect_to @state_of_origin, notice: 'State of origin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @state_of_origin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_of_origins/1
  # DELETE /state_of_origins/1.json
  def destroy
    @state_of_origin = StateOfOrigin.find(params[:id])
    @state_of_origin.destroy

    respond_to do |format|
      format.html { redirect_to state_of_origins_url }
      format.json { head :no_content }
    end
  end
  
  
  private
  
  def check_superadmin
    if current_user.has_role? :superadmin
    else
      redirect_to root_path
    end
  end
end
