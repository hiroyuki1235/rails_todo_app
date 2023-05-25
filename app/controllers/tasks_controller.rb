class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :done, :undone]

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

  def destroy
    @task.destroy
    redirect_to tasks_path, success: 'タスクを削除しました。'
  end

  def donelist
    @doen_tasks = Task.where(status: 1)
  end

  def done
    @task.update_attribute(:status, 1)

    if @task.save
      redirect_to tasks_path, success: 'タスクを完了しました。'
    end
  end

  def undone
    @task.update_attribute(:status, 0)

    if @task.save
      redirect_to tasks_path, success: 'タスクを未完了にしました。'
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
