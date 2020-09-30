class SessionsController < ApplicationController
  before_action :session_check, only:[:new]
  
  def new
  end

  def create
    if logged_in?
      flash[:info] = 'You are already logged in !'
      redirect_to root_path
    else
      user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:success] = 'Connected!'
          redirect_to user_path(user.id)
      else
        flash.now[:danger] = 'Error!! Connexion failed.'
        redirect_to new_session_path
      end
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:danger] = "I've logged out, Bye !!"
    redirect_to new_session_path
  end

  def session_check
    redirect_to user_path(current_user.id), notice:('you are already logged') if logged_in?
  end
end
