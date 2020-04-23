require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout" do
    get root_path
    assert_template '/'
    assert_select "a[href=?]", login_path, count: 1
  end
end
