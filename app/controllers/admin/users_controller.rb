class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    @user = User.all.order('created_at DESC').page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'user are successfully create'
      redirect_to (admin_users_path)
    else
      flash[:danger] = 'oO something wrong'
      render :new
      
    end
  end

  def show
    @task = @user.tasks
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success]="User update"
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
    user = User.find(params[:id])
    if (current_user == user) && (current_user.admin?)
      flash[:error] = "Can not delete own admin account!"
    else
      user.destroy
      flash[:success] = "User destroyed."
    end
  redirect_to users_path
  end
  
  
  private


  def user_params
    params.require(:user).permit(:name, :email, :admin, :password,  :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
