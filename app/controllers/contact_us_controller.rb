class ContactUsController < ApplicationController

  before_filter :authenticate_user!, only: [:home]
  before_filter :only_allow_user, only: [:home]
  
  
  def index
    @office_addresses = OfficeAddress.all
    @email_addresses = EmailAddress.all
  end

  def home
    render :layout => 'mainpage'
  end

  private

  

  def only_allow_user
    if current_user.has_role? :user
      else
      redirect_to root_path
    end
  end
end
