require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get todo_path
    assert_response :success
  end

end
