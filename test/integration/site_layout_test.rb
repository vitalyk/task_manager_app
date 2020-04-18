require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout" do
    get root_path
    assert_template 'projects/index'
  end
end
