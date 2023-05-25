require "test_helper"

class TasksDestroyTest < ActionDispatch::IntegrationTest
  def setup
    @task1 = tasks(:task1)
  end

  test 'successful destroy' do
    get tasks_path
    assert_template 'tasks/index'
    assert_difference 'Task.count', -1 do
      delete task_path(@task1)
    end
    assert_redirected_to tasks_path
    follow_redirect!
    assert_template 'tasks/index'
    assert_select 'p.alert.alert-success', 'タスクを削除しました。'
  end
end
