class UsersController < ApplicationController
  
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User Created!"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def destroy
    
  end

  def update
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
