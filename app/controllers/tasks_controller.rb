class TasksController < ApplicationController
  def index
    @tasks = Task.where(status: 0)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'タスクを新規作成しました。'
      redirect_to tasks_path
    else
      flash.now[:error] = @task.errors.full_messages
      render 'new'
    end
  end


  private

    def task_params
      params.require(:task).permit(:name)
    end
end
