require 'test_helper'

class DisplayusurpationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get displayusurpation_index_url
    assert_response :success
  end

end
