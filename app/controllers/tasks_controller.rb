class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update]

  def index
    @tasks = Task.where(status: 0)
  end

  def new
    @task = Task.new
  end

  def edit
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

  def update
    @task.update(task_params)

    if @task.save
      redirect_to tasks_path, success: 'タスクを更新しました。'
    else
      flash.now[:danger] = 'タスク名を入力してください。'
      render 'edit'
    end
  end


  private

    def task_params
      params.require(:task).permit(:name)
    end

    def set_task
      @task = Task.find(params[:id])
    end

end
