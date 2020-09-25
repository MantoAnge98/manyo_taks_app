class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #Add session helper method
  include SessionsHelper
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

end
