require "test_helper"

class TasksCreateTest < ActionDispatch::IntegrationTest
  test 'successful create' do
    get new_task_path
    assert_template 'tasks/new'
    assert_difference 'Task.count', 1 do
      post tasks_path,
        params: {
          task: {
            name: 'Task Name'
          }
        }
    end
    assert_redirected_to tasks_url
    follow_redirect!
    assert_template 'tasks/index'
    assert_select 'p.alert.alert-success', 'タスクを新規作成しました。'
  end

  test 'unsuccessful create' do
    get new_task_path
    assert_template 'tasks/new'
    assert_difference 'Task.count', 0 do
      post tasks_path,
        params: {
          task: {
            name: ''
          }
        }
    end
    assert_template 'tasks/new'
    assert_select 'p.alert.alert-danger', 'タスク名を入力してください。'
  end
end
