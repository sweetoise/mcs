class EmptySelectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  layout "administrator"
  # GET /empty_selects
  # GET /empty_selects.json
  def index
    @empty_selects = EmptySelect.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @empty_selects }
    end
  end

  # GET /empty_selects/1
  # GET /empty_selects/1.json
  def show
    @empty_select = EmptySelect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @empty_select }
    end
  end

  # GET /empty_selects/new
  # GET /empty_selects/new.json
  def new
    @empty_select = EmptySelect.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @empty_select }
    end
  end

  # GET /empty_selects/1/edit
  def edit
    @empty_select = EmptySelect.find(params[:id])
  end

  # POST /empty_selects
  # POST /empty_selects.json
  def create
    @empty_select = EmptySelect.new(params[:empty_select])

    respond_to do |format|
      if @empty_select.save
        format.html { redirect_to @empty_select, notice: 'Empty select was successfully created.' }
        format.json { render json: @empty_select, status: :created, location: @empty_select }
      else
        format.html { render action: "new" }
        format.json { render json: @empty_select.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /empty_selects/1
  # PUT /empty_selects/1.json
  def update
    @empty_select = EmptySelect.find(params[:id])

    respond_to do |format|
      if @empty_select.update_attributes(params[:empty_select])
        format.html { redirect_to @empty_select, notice: 'Empty select was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @empty_select.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empty_selects/1
  # DELETE /empty_selects/1.json
  def destroy
    @empty_select = EmptySelect.find(params[:id])
    @empty_select.destroy

    respond_to do |format|
      format.html { redirect_to empty_selects_url }
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
