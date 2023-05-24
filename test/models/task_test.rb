require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = Task.new(name: "Test Task", status: 0)
  end

  test 'name should be present' do
    @task.name = " "
    assert_not @task.valid?
  end

  test 'name should not be too long' do
    @task.name = "a" * 31
    assert_not @task.valid?
  end

  test 'task should be present' do
    @task.status = ""
    assert_not @task.valid?
  end
end
