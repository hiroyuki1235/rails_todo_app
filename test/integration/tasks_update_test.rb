require "test_helper"

class TasksUpdateTest < ActionDispatch::IntegrationTest
  def setup
    @task1 = tasks(:task1)
  end

  test 'successful update' do
    newname = 'new-task'

    get edit_task_path(@task1)
    assert_template 'tasks/edit'
    patch task_path(@task1),
      params: {
        task: {
          name: newname
        }
      }
    assert_redirected_to tasks_url
    follow_redirect!
    assert_template 'tasks/index'
    @task1.reload
    assert_equal newname, @task1.name
    assert_select 'p.alert.alert-success', 'タスクを更新しました。'
  end

  test 'unsuccessful update' do
    get edit_task_path(@task1)
    assert_template 'tasks/edit'
    patch task_path(@task1),
      params: {
        task: {
          name: ''
        }
      }
    assert_template 'tasks/edit'
    assert_select 'p.alert.alert-danger', 'タスク名を入力してください。'
  end
end
