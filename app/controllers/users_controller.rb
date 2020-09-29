class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]
  before_action :user_check, only: [:index,:show,:edit, :update, :destroy]
  before_action :login_check, only:[:new, :index]

  def index
    @user = User.all
  end
  
  def new
    if logged_in?
      redirect_to users_path, notice: "You are already logged"
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if logged_in?
        redirect_to tasks_path
        flash[:success]="Account created successfull"
      else
        session[:user_id] = @user.id
        redirect_to users_path
        flash[:success]="account created successfull"
      end
    else
      flash[:danger]="something is wrong !"
      render :new
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
      flash[:success]= "User updated !!"
      if current_user.admin?
        redirect_to tasks_path
      else
        redirect_to user_path(current_user.id)
      end
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    flash[:danger]="User are Deleted "
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_check
     unless current_user == @user || current_user.admin?
      redirect_to user_path(current_user.id)
     end
  end

  def login_check
     if logged_in?
      redirect_to user_path(current_user.id)
     end
  end

end
