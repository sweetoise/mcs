class ScanController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  before_filter :check_pin_attempt
  
  def pin_attempt
  end
  
  private
  
  
  def check_pin_attempt
    if current_user.pin_load_attempt <= 4
      flash[:error] = 'Invalid Pin'
      redirect_to :controller => 'verifypins', :action => 'new'
    end
  end
  

  def check_superadmin
    if current_user.has_role? :superadmin
      redirect_to :controller => 'superadmin/panel', :action => 'index'
    end
  end

  def only_allow_user
    if current_user.has_role? :user
      else
      redirect_to root_path
    end
  end
end
