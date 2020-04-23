require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    user = users(:vitaliy)
    log_in_as(user)
    get new_user_project_path(user)
    assert_response :success
  end
end
