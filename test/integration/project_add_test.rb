require 'test_helper'

class ProjectAddTest < ActionDispatch::IntegrationTest

  test "invalid TODO name" do
    get todo_path
    assert_no_difference 'Project.count' do
      post projects_path, params: { project: { name:  "" } }
    end
    assert_template 'projects/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid TODO name" do
    get todo_path
    assert_difference 'Project.count', 1 do
      post project_path, params: { project: { name:  "FooBar name" } }
    end
    follow_redirect!
    assert_template 'projects/show'
    assert_not flash.nil?
  end
end
