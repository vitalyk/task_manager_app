require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:vitaliy)
    @other_user = users(:jhony)
  end

  # test "should redirect when logged in as wrong user" do
  #   get login_url
  #   log_in_as(@other_user)
  #   post new_user_project_path(@user), params: { projects: { name: 'test project'} }
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end
end
