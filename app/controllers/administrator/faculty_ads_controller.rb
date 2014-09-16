class Administrator::FacultyAdsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_ads_updates_admin_and_superadmin
  # GET /faculty_ads
  # GET /faculty_ads.json
  
  layout "administrator"
  def index
    @faculty_ads = FacultyAd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faculty_ads }
    end
  end

  # GET /faculty_ads/1
  # GET /faculty_ads/1.json
  def show
    @faculty_ad = FacultyAd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faculty_ad }
    end
  end

  # GET /faculty_ads/new
  # GET /faculty_ads/new.json
  def new
    @faculty_ad = FacultyAd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faculty_ad }
    end
  end

  # GET /faculty_ads/1/edit
  def edit
    @faculty_ad = FacultyAd.find(params[:id])
  end

  # POST /faculty_ads
  # POST /faculty_ads.json
  def create
    @faculty_ad = FacultyAd.new(params[:faculty_ad])

    respond_to do |format|
      if @faculty_ad.save
        format.html { redirect_to ([:administrator, @faculty_ad]), notice: 'Faculty ad was successfully created.' }
        format.json { render json: @faculty_ad, status: :created, location: @faculty_ad }
      else
        format.html { render action: "new" }
        format.json { render json: @faculty_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faculty_ads/1
  # PUT /faculty_ads/1.json
  def update
    @faculty_ad = FacultyAd.find(params[:id])

    respond_to do |format|
      if @faculty_ad.update_attributes(params[:faculty_ad])
        format.html { redirect_to ([:administrator, @faculty_ad]), notice: 'Faculty ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faculty_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculty_ads/1
  # DELETE /faculty_ads/1.json
  def destroy
    @faculty_ad = FacultyAd.find(params[:id])
    @faculty_ad.destroy

    respond_to do |format|
      format.html { redirect_to administrator_faculty_ads_url }
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
