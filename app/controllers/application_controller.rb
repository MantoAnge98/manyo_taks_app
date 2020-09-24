class ApplicationController < ActionController::Base
  before_action :login_required
  protect_from_forgery with: :exception
  #Add session helper method
  include SessionHelper
  #Define method to authenticate user
  #If the currently logged in user does not exist,
  add_flash_types :danger, :info, :warning, :success
  
  def authenticate_user
    # redirect them to the login page.
    if @current_user == nil
      flash[:notice] = t('notice.You must be logged in!')
      redirect_to new_session_path
    end
  end
  
  private
  def login_required
    redirect_to new_session_path unless current_user
  end

end
