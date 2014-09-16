class VerifylevelsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  before_filter :set_level!
  def index
  end

  def show
  end

  private

  def set_level!
    @select_level_id = Level.find_by_id(params[:id])

    if @select_level_id
      User.where(:id => current_user.id).update_all(:level_id => @select_level_id)
      current_user.save

      redirect_to :controller => 'mainpage', :action => 'index'
    else
      redirect_to :controller => 'mainpage', :action => 'index'
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
