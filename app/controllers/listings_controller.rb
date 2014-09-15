class ListingsController < Devise::RegistrationsController
  before_filter :authenticate_user!
  before_filter :deny_superadmin, :only => [:edit]
  before_filter :check_user_role, :only => [:edit]
  
  
  def index
  end

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end
  
  def destroy
    super
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    '/signup/account_activation'
  end

  private

  def check_user_role
    if current_user.has_role? :user
      render :layout => "mainpage"
    else
      render :layout => "administrator"
    end
  end
  
  def deny_superadmin
    if current_user.has_role? :superadmin
      render :layout => 'administrator'
    end
  end

end
