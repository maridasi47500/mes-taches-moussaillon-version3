require 'test_helper'

class MysurnamesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get mysurnames_update_url
    assert_response :success
  end

end
