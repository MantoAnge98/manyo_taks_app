class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    if current_user.try(:admin?)
      @user = User.all.order('created_at DESC').page params[:page]
    else
      flash[:success] = 'Create Admin User'
      redirect_to new_admin_user_path
    end
  end

  def new
    @user = User.new
  end

  def create
    if @user.save
      @user = User.new(user_params)
      flash[:success] = 'user are successfully create'
      redirect_to admin_users_path
    else
      flash[:danger] = 'Something wrong'
      render :new
    end
  end

  def show
    if current_user.admin
      @task = @user.tasks
    else
      flash[:info] = 'Please Create Admin User'
      redirect_to new_admin_user_path
    end
    
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success]="user update"
      if current_user.admin?
        redirect_to admin_users_path
      else
        redirect_to user_path(current_user.id)
      end
    else
      if current_user.admin?
        flash[:danger] = 'you are currently the only administrator. Please choose another administrator before'
        render :new
      else
        flash[:danger] = 'Something wrong !!'
        render :new
      end
    end
  end
  def destroy
    if @user.destroy
      flash[:success] = 'user are successfully destroy'
      redirect_to admin_users_path
    else
      if current_user.admin? == @user.destroy
        flash[:danger] = 'you are currently the only administrator. Please choose another administrator before'
        redirect_to admin_users_path
      else
        flash[:danger] = 'Something wrong'
        redirect_to admin_users_path
      end
    end
  end
  
private
def user_params
  params.require(:user).permit(:name, :email, :admin, :password,  :password_confirmation)
end

def set_user
  @user = User.find(params[:id])
end
end
