require 'test_helper'

class MymenuControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mymenu_new_url
    assert_response :success
  end

end
