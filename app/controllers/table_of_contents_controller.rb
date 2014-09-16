class TableOfContentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /table_of_contents
  # GET /table_of_contents.json
  layout "administrator"
  def index
    @table_of_contents = TableOfContent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_of_contents }
    end
  end

  # GET /table_of_contents/1
  # GET /table_of_contents/1.json
  def show
    @table_of_content = TableOfContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_of_content }
    end
  end

  # GET /table_of_contents/new
  # GET /table_of_contents/new.json
  def new
    @table_of_content = TableOfContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_of_content }
    end
  end

  # GET /table_of_contents/1/edit
  def edit
    @table_of_content = TableOfContent.find(params[:id])
  end

  # POST /table_of_contents
  # POST /table_of_contents.json
  def create
    @table_of_content = TableOfContent.new(params[:table_of_content])

    respond_to do |format|
      if @table_of_content.save
        format.html { redirect_to @table_of_content, notice: 'Table of content was successfully created.' }
        format.json { render json: @table_of_content, status: :created, location: @table_of_content }
      else
        format.html { render action: "new" }
        format.json { render json: @table_of_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /table_of_contents/1
  # PUT /table_of_contents/1.json
  def update
    @table_of_content = TableOfContent.find(params[:id])

    respond_to do |format|
      if @table_of_content.update_attributes(params[:table_of_content])
        format.html { redirect_to @table_of_content, notice: 'Table of content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table_of_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_of_contents/1
  # DELETE /table_of_contents/1.json
  def destroy
    @table_of_content = TableOfContent.find(params[:id])
    @table_of_content.destroy

    respond_to do |format|
      format.html { redirect_to table_of_contents_url }
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
