class SecondSemesterQuestionsAndSolutionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_superadmin
  before_filter :only_allow_user
  before_filter :check_expiry

  layout "mainpage", only: [:index, :show]
  def index
  end

  def show
    @second_semester_past_question = SecondSemesterPastQuestion.find_by_id(params[:id])
  end

  private

  def check_expiry
    if current_user.expiration == nil
      redirect_to :controller => 'account', :action => 'expired_subscription'
    else
      if (current_user.expiration - Time.current).to_i <= 0
        redirect_to :controller => 'account', :action => 'expired_subscription'
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
