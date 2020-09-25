class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:index,:show, :new, :edit, :destroy]
  before_action :user_check, only:[:show, :edit, :destroy]
  
  def index
    @user = User.all
    #Use params sort_expired + deadline property
    #to create tri ystem
    if params[:sort_expired]
      @task = Task.all.order(deadline: :asc).page params[:page]
      #It's date, there a choose order by asc (Old date)
    #Define Pirority, order by desc
    elsif params[:sort_priority] 
      #Define function to sort by priority, there i choose order by asc (High => Middle => low)
      @task = Task.all.order(priority: :asc).page params[:page]
    elsif params[:name].blank? && params[:status]
      #This function checks if the name field is empty, 
      #then checks if the status field contains a value.
      if params[:status] == ""
        flash[:danger] =  "No data found"
        redirect_to tasks_path
      else
        @task = Task.where(status: params[:status]).page params[:page]
      end
    elsif params[:name] && params[:status].blank?
      #This function checks if the status field is empty, 
      #then checks if the name field contains a value.
      @task = Task.where(name: params[:name]).page params[:page]
    elsif params[:name] && params[:status]
      #This function controls whether the name and status fields contain values
      @task = Task.where(name: params[:name]).where(status: params[:status]).page params[:page]
    else 
      @task = Task.all.order(created_at: :desc).page params[:page]
    end
  end

  def new       
    if params[:back]
      @task = Task.new(task_params)
    else        
      @task = Task.new
    end
  end

  def create
    @task = current_user.tasks.build(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        flash[:success] = "Task was successfully created."
        redirect_to tasks_path
      else
        render :new
      end
    end
  end


  def edit
    @task = Task.find(params[:id])
  end

  def confirm
    @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)
    render :new if @task.invalid?
  end

  def update
    if params[:back]
      render :new
    else
      @task = current_user.tasks.find(params{:id})
      if @task.update(task_params)
        flash[:success] =  "Task was successfully updated."
        redirect_to tasks_path
      else
        render :edit
      end
    end
  end  

  def show
    @task = current_user.tasks.find(params{:id})
  end

  def destroy
    @task = current_user.tasks.find(params{:id})
    @task.destroy
    flash[:info] =  "Task was successfully deleted."
    redirect_to tasks_path
  end

  private 
  def task_params
    params.require(:task).permit(:name, :detail, :deadline, :status, :priority)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end

  #Verify is user is admin or not
  def user_check
    unless current_user.id == @task.user.id || current_user.admin?
      flash[:danger] = "Access Denied !"
      redirect_to tasks_path
    end
  end

  #Verify is user is logged_in or not
  def login_check
    unless logged_in?
      flash[:info] = "you are not login!"
      redirect_to new_session_path
    end
  end
  
  
end
