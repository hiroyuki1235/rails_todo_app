class TasksController < ApplicationController
  def index
    @tasks = Task.where(status: 0)
  end
end
