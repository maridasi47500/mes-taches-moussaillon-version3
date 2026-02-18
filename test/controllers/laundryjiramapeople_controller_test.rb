require 'test_helper'

class LaundryjiramapeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get laundryjiramapeople_show_url
    assert_response :success
  end

end
