require 'test_helper'

class MangathequeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mangatheque_index_url
    assert_response :success
  end

end
