class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]
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
    if logged_in?
      @user = User.find(params[:id])
      
    else
      redirect_to users_path, notice: "You are already logged"
    end
  end

  def destroy
    
  end

  def update
    if @user.update(user_params)
      flash[:success]= "User updated !!"
      redirect_to user_path(current_user.id)
    else
      flash[:danger]= "Something is wrong !!"
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
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def login_check
     if logged_in?
      redirect_to user_path(current_user.id)
     end
  end

end
