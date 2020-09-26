class SessionsController < ApplicationController
  before_action :session_check, only:[:new]

  def new
    unless logged_in?
      @user = User.new
    else
      redirect_to root_path, notice: 'You are already logged in.'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = 'Congrats!! You are Connected!'
        redirect_to admin_users_path
    else
      flash.now[:danger] = 'Error!! Connexion failed.'
      redirect_to new_session_path
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
