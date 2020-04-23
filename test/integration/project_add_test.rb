require 'test_helper'

class ProjectAddTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:vitaliy)
  end

  test "invalid TODO name" do
    get login_url
    log_in_as(@user)
    get new_user_project_path(@user)
    assert_no_difference 'Project.count' do
      post projects_path, params: { project: { name:  "" } }
    end
    assert_template 'projects/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid TODO name" do
    get login_url
    log_in_as(@user)
    get new_user_project_path(@user)
    assert_difference 'Project.count', 1 do
      post projects_path, params: { project: { name: "FooBar name" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
  end
end
