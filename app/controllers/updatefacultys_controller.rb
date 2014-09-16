class UpdatefacultysController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :update_user_faculty!
  before_filter :only_allow_user
  
  
  
  def index
  end

  def show
  end

  private

  
  def update_user_faculty!
    @faculty_id = Faculty.find_by_id(params[:id])

    if @faculty_id
      User.where(:id => current_user.id).update_all(:faculty_id => @faculty_id)
      current_user.save
      redirect_to :controller => 'mainpage', :action => 'index'
    else
      redirect_to :controller => 'listings', :action => 'edit'
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
