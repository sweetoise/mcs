class ListingsController < Devise::RegistrationsController
  before_filter :authenticate_user!
  before_filter :deny_superadmin, :only => [:edit]
  before_filter :check_user_role, :only => [:edit]

  layout :detect_browser
  
  
  def index
    @updates = Update.all
  end

  def new
    @updates = Update.all
    super
  end

  def create
    @updates = Update.all
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

  MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

  def detect_browser
    agent = request.headers["HTTP_USER_AGENT"].downcase
    MOBILE_BROWSERS.each do |m|
      return "mobile_application" if agent.match(m)
    end
    return "listings"
  end

end
