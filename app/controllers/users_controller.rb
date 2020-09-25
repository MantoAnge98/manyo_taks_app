class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :user_check, only: [:index,:show,:edit, :update, :destroy]
  before_action :login_check, only:[:new, :index]

  def new
    @user = User.new
  end

  def create
    #After i will delete these function
    #Because it's same things before_action login_check
    if logged_in?
      redirect_to users_path, notice: "You are already logged"
    else
      @user = User.new(user_params)
      if @user.save
        #redirect_to new_session_path, notice: "Account create, please log In"
        flash[:success] = "User Created!"
        redirect_to user_path(@user.id)
      else
        flash[:danger]="something is wrong !"
        render :new
      end
    end
  end

  def show
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    
  end

  def update
    if @user.update(user_params)
      flash[:success]="User are updated"
      redirect_to user_path(current_user.id), notice: "Your profile is update"
    else
      flash[:danger]="something is wrong !"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:danger]="User are Deleted "
    redirect_to new_user_path
  end

  private
  def user_params
    @user = params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_check
    redirect_to user_path(current_user.id), notice:('access deny') unless current_user == @user || current_user.admin?
  end

  def login_check
    redirect_to user_path(current_user.id), notice:('you are already logged') if logged_in?
  end
  
end
