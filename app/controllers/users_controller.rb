class UsersController < AdministratorController

  before_filter :authenticate_user!
  before_filter :update_pin_load_attempt, :only => [ :update ]
  before_filter :only_allow_superadmin, :only => [ :index, :update, :destroy ]
  
  
  
  
  def index
    @users = User.all
  end
  

  def show
    @user = User.find_by_id(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :superadmin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  private
  
  

  def only_allow_superadmin
    redirect_to root_path, :alert => 'Not authorized as an superadministrator.' unless current_user.has_role? :superadmin
  end

  def update_pin_load_attempt
    @user = User.find(params[:id])
    if @user.pin_access = true
      User.where(:id => @user.id).update_all(:pin_load_attempt => 0)
    else
      @user.pin_access = false
      User.where(:id => @user.id).update_all(:pin_load_attempt => 4)
    end
    render 'index', :alert => 'Not authorized as an superadministrator.' unless current_user.has_role? :superadmin
  end
  
  

end
