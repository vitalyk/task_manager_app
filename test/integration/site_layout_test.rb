require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout" do
    get root_path
    assert_template 'projects/index'
    assert_select "a[href=?]", root_path, count: 1
  end
end
