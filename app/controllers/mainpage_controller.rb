class MainpageController < ApplicationController
  layout "mainpage"
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  before_filter :check_expiry
  def index
  end

  def show
  end
  private

  def check_expiry
    if (current_user.expiration).to_i <= 0 and (current_user.institution == nil or current_user.faculty == nil or current_user.department == nil or current_user.level == nil)
      redirect_to :controller => 'listings', :action => 'edit'
    end
  end
  
  def check_superadmin
    if current_user.has_role? :admin_user or current_user.has_role? :superadmin or current_user.has_role? :class_note_admin or current_user.has_role? :library_admin or current_user.has_role? :past_questions_admin or current_user.has_role? :voucher_admin or current_user.has_role? :ads_updates_admin
      redirect_to :controller => 'administrator', :action => 'index'
    end
  end

  def only_allow_user
    if current_user.has_role? :user
      else
      redirect_to root_path
    end
  end

end
