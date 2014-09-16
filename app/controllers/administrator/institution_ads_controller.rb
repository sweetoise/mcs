class Administrator::InstitutionAdsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_ads_updates_admin_and_superadmin
  # GET /institution_ads
  # GET /institution_ads.json
  layout "administrator"
  def index
    @institution_ads = InstitutionAd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @institution_ads }
    end
  end

  # GET /institution_ads/1
  # GET /institution_ads/1.json
  def show
    @institution_ad = InstitutionAd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @institution_ad }
    end
  end

  # GET /institution_ads/new
  # GET /institution_ads/new.json
  def new
    @institution_ad = InstitutionAd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @institution_ad }
    end
  end

  # GET /institution_ads/1/edit
  def edit
    @institution_ad = InstitutionAd.find(params[:id])
  end

  # POST /institution_ads
  # POST /institution_ads.json
  def create
    @institution_ad = InstitutionAd.new(params[:institution_ad])

    respond_to do |format|
      if @institution_ad.save
        format.html { redirect_to ([:administrator, @institution_ad]), notice: 'Institution ad was successfully created.' }
        format.json { render json: @institution_ad, status: :created, location: @institution_ad }
      else
        format.html { render action: "new" }
        format.json { render json: @institution_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /institution_ads/1
  # PUT /institution_ads/1.json
  def update
    @institution_ad = InstitutionAd.find(params[:id])

    respond_to do |format|
      if @institution_ad.update_attributes(params[:institution_ad])
        format.html { redirect_to ([:administrator, @institution_ad]), notice: 'Institution ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @institution_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institution_ads/1
  # DELETE /institution_ads/1.json
  def destroy
    @institution_ad = InstitutionAd.find(params[:id])
    @institution_ad.destroy

    respond_to do |format|
      format.html { redirect_to administrator_institution_ads_url }
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
