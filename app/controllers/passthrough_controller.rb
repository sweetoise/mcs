class PassthroughController < ApplicationController
  before_filter :set_user_role
  def index
  end

  private

  def set_user_role
    if current_user.has_role? :superadmin or current_user.has_role? :admin_user or current_user.has_role? :class_note_admin
      redirect_to :controller=>'administrator', :action => 'index'
    elsif current_user.has_role? :user
      redirect_to :controller => 'mainpage', :action => 'index'
    end
  end
end
