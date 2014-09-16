class CopywriteAddressesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_user_and_superadmin
  # GET /copywrite_addresses
  # GET /copywrite_addresses.json
  layout "administrator"
  def index
    @copywrite_addresses = CopywriteAddress.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @copywrite_addresses }
    end
  end

  # GET /copywrite_addresses/1
  # GET /copywrite_addresses/1.json
  def show
    @copywrite_address = CopywriteAddress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @copywrite_address }
    end
  end

  # GET /copywrite_addresses/new
  # GET /copywrite_addresses/new.json
  def new
    @copywrite_address = CopywriteAddress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @copywrite_address }
    end
  end

  # GET /copywrite_addresses/1/edit
  def edit
    @copywrite_address = CopywriteAddress.find(params[:id])
  end

  # POST /copywrite_addresses
  # POST /copywrite_addresses.json
  def create
    @copywrite_address = CopywriteAddress.new(params[:copywrite_address])

    respond_to do |format|
      if @copywrite_address.save
        format.html { redirect_to @copywrite_address, notice: 'Copywrite address was successfully created.' }
        format.json { render json: @copywrite_address, status: :created, location: @copywrite_address }
      else
        format.html { render action: "new" }
        format.json { render json: @copywrite_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /copywrite_addresses/1
  # PUT /copywrite_addresses/1.json
  def update
    @copywrite_address = CopywriteAddress.find(params[:id])

    respond_to do |format|
      if @copywrite_address.update_attributes(params[:copywrite_address])
        format.html { redirect_to @copywrite_address, notice: 'Copywrite address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @copywrite_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /copywrite_addresses/1
  # DELETE /copywrite_addresses/1.json
  def destroy
    @copywrite_address = CopywriteAddress.find(params[:id])
    @copywrite_address.destroy

    respond_to do |format|
      format.html { redirect_to copywrite_addresses_url }
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
