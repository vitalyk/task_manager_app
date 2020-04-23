require 'test_helper'

class ProjectsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:vitaliy)
    @office = projects(:office)
  end

  # test "delete project" do
  #   get login_url
  #   log_in_as(@user)
  #   assert_template 'users/show'
  #   assert_difference '@user.projects.count', -1 do
  #     delete user_project_path(@office)
  #   end
  # end
end
