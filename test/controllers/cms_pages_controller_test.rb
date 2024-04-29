require "test_helper"

class CmsPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cms_pages_show_url
    assert_response :success
  end
end
