class Administrator::PinsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_voucher_admin_and_superadmin
  # GET /pins
  # GET /pins.json
  layout "administrator"
  def index
    @pins = Pin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pins }
    end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    @pin = Pin.find(params[:id])
    @pins = Pin.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/new
  # GET /pins/new.json
  def new
    @pin = Pin.new
    @pins = Pin.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/1/edit
  def edit
    @pin = Pin.find(params[:id])
    @pins = Pin.all
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(params[:pin])
    @pins = Pin.all

    respond_to do |format|
      if @pin.save
        format.html { redirect_to ([:administrator, @pin]), notice: 'Pin was successfully created.' }
        format.json { render json: @pin, status: :created, location: @pin }
      else
        format.html { render action: "new" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pins/1
  # PUT /pins/1.json
  def update
    @pin = Pin.find(params[:id])

    respond_to do |format|
      if @pin.update_attributes(params[:pin])
        format.html { redirect_to ([:administrator, @pin]), notice: 'Pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy

    respond_to do |format|
      format.html { redirect_to administrator_pins_url }
      format.json { head :no_content }
    end
  end

  private

  def check_voucher_admin_and_superadmin
    if current_user.has_role? :voucher_admin or current_user.has_role? :superadmin
    else
      redirect_to root_path
    end
  end
end
