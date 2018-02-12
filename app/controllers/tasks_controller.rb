class TasksController < ApplicationController
  def index
    if user_signed_in?
      @tasks = Task.all
    else
      redirect_to user_session_path
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.userId = current_user.id

    if(@task.save)
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(name: params[:name], description: params[:description])
    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!
    redirect_to tasks_path
  end

  private def task_params
    params.require(:post).permit(:name, :description)
  end
end
