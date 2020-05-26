class TasksController < ApplicationController
  # list tasks
  def index
    @tasks = Task.all
  end

  # view the details of a task
  def show
    @task = Task.find(params[:id])
  end

  # add a new task
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  # edit a task (mark as completed / update title & details)
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  # remove a task
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
