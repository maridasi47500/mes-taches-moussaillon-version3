require 'test_helper'

class TorolananaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get torolanana_index_url
    assert_response :success
  end

end
