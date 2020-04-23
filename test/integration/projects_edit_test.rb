require 'test_helper'

class ProjectsEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:vitaliy)
    @project = projects(:home)
  end

  test "unsuccessful edit" do
    get login_url
    log_in_as(@user)
    get edit_user_project_path(@user, @project)
    assert_template 'projects/edit'
    patch user_project_path(@user, @project), params: { project: { name:  "" } }
    assert_template 'projects/edit'
    assert_select 'div.alert', 'The form contains 2 errors.'
  end

  test "successful edit" do
    get login_url
    log_in_as(@user)
    get edit_user_project_path(@user, @project)
    assert_template 'projects/edit'
    name  = "Baz Baz"
    patch user_project_path(@user, @project), params: { project: { name:  name } }
    assert_not flash.empty?
    follow_redirect!
    assert_template 'users/show'
    @project.reload
    assert_equal name.downcase,  @project.name.downcase
  end
end



