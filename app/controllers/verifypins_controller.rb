class VerifypinsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_expiry
  before_filter :check_pin_attempts
  before_filter :check_superadmin
  before_filter :only_allow_user

  layout "mainpage", only: [:new, :create]
  
  
  def new
  end

  def create
    pin = Pin.find_by_number(params[:verifypins][:number])
    pin_failure_attempt = (current_user.pin_load_attempt + 1)

    if pin
      pin_select = pin.number

      User.where(:id => current_user.id).update_all(:expiration => Time.now + 30.days, :pin => pin_select, :pin_load_attempt => 0)
      current_user.save

      redirect_to :controller => 'activated', :action => 'index'

    pin.destroy

    else
      User.where(:id => current_user.id).update_all(:pin_load_attempt => pin_failure_attempt)
      current_user.save
      redirect_to :controller => 'scan', :action => 'pin_attempt'
    end
  end

  def destroy
  end

  private

  def check_expiry
    if current_user.expiration == nil
      else
      if (current_user.expiration - Time.current).to_i >= 0
        redirect_to :controller => 'account', :action => 'active_subscription'
      end
    end
  end

  def check_pin_attempts
    if current_user.pin_load_attempt >= 4
      User.where(:id => current_user.id).update_all(:pin_access => false)
      current_user.save
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
