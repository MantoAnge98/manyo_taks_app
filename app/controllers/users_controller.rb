class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
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
      redirect_to user_path(current_user.id), notice: "Your profile is update"
    else
      flash[:danger]="something is wrong !"
      render :edit
    end
  end

  private
  def user_params
    @user = params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
