require 'test_helper'

class LovedontloveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lovedontlove_index_url
    assert_response :success
  end

end
