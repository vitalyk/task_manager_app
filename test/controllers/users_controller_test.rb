require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:vitaliy)
  end

  test "should redirect when not logged in" do
    get new_user_project_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
    follow_redirect!
    assert_select 'div.alert', 'Please log in.'
  end
end
