class AccountController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  before_filter :check_expiry
  

  layout "mainpage"
  def active_subscription
  end

  def expired_subscription
  end

  private

  def check_expiry

    if current_user.expiration == nil
      render 'expired_subscription'
    else
      if (current_user.expiration - Time.current).to_i >= 1
        render 'active_subscription'
      else (current_user.expiration - Time.current).to_i < 1
        render 'expired_subscription'
      end
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

