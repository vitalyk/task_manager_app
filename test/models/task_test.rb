require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @user = users(:vitaliy)
    @project = @user.projects.create(name: "Example Project")
    @task = @project.tasks.create(name: "Lorem ipsum")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "project id should be present" do
    @task.project_id = nil
    assert_not @task.valid?
  end

  test "name should be present" do
    @task.name = "   "
    assert_not @task.valid?
  end

  test "name should be at most 140 characters" do
    @task.name = "a" * 141
    assert_not @task.valid?
  end

  test "associated task should be destroyed" do
    @project.tasks.create!(name: "Lorem ipsum dolor")
    assert_difference '@project.tasks.count', -1 do
      @project.tasks.last.destroy
    end
  end
end
