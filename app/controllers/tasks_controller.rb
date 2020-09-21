class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    #Use params sort_expired + deadline property
    #to create tri ystem
    if params[:sort_expired]
      @task = Task.all
      @task = @task.order(deadline: :desc)
    else
      @task = Task.all
      @task = @task.order(created_at: :desc)
    end
    
  end

  def new       
      @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
    render :new if @task.invalid?
  end

  def update
    if params[:back]
      render :new
    else
      @task = Task.find(params[:id])
      if @task.update(task_params)
        flash[:success] =  "Task was successfully updated."
        redirect_to tasks_path
      else
        render :edit
      end
    end
  end  

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task.destroy
    flash[:info] =  "Task was successfully deleted."
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :detail, :deadline)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end
