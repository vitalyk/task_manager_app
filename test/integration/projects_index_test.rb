require 'test_helper'

class ProjectsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @baz = projects(:baz)
  end

  test "delete project" do
    get projects_path
    assert_template 'projects/index'
    assert_difference 'Project.count', -1 do
      delete project_path(@baz)
    end
  end
end
