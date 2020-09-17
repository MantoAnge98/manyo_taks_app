class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @task = Task.all
  end

  def new
    if params[:back]
      @task = Task.new(task_params)
    else        
      @task = Task.new
    end
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to taks_path, notice: 'Task was successfully created.'
      else
        render :new, flash: { info: "Task was not saved!"}
      end
    end
  end


  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to taks_path, notice: 'Task was successfully created.'
    else
      render :edit, flash: { info: "Task was not update!"}
    end
  end  

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task.destroy
    redirect_to taks_path, notice: 'Task was successfully deleted.'
  end

  private
    def task_params
      params.require(:task).permit(:name, :detail)
    end
    
    def set_task
      @task = Task.find(params[:id])
    end
end
