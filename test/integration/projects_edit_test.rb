require 'test_helper'

class ProjectsEditTest < ActionDispatch::IntegrationTest

  def setup
    @project = projects(:foo)
  end

  test "unsuccessful edit" do
    get edit_project_path(@project)
    assert_template 'projects/edit'
    patch project_path(@project), params: { project: { name:  "" } }
    assert_template 'projects/edit'
    assert_select 'div.alert', 'The form contains 2 errors.'
  end

  test "successful edit" do
    get edit_project_path(@project)
    assert_template 'projects/edit'
    name  = "Baz Baz"
    patch project_path(@project), params: { project: { name:  name } }
    assert_not flash.empty?
    follow_redirect!
    assert_template 'projects/index'
    #assert_redirected_to 'projects'
    @project.reload
    assert_equal name.downcase,  @project.name.downcase
  end
end



