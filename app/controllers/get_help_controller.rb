class GetHelpController < ApplicationController
  
  before_filter :authenticate_user!, only: [:view]
  before_filter :only_allow_user, only: [:view]

  def index
    @table_of_contents = TableOfContent.all
    @faqs = Faq.all
  end
  
  def view
    render :layout => 'mainpage'
  end
  
  def only_allow_user
    if current_user.has_role? :user
      else
      redirect_to root_path
    end
  end

end
