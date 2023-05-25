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
      redirect_to tasks_path, success: 'タスクを新規作成しました。'
    else
      flash.now[:danger] = 'タスク名を入力してください。'
      render 'new'
    end
  end


  private

    def task_params
      params.require(:task).permit(:name)
    end
end
