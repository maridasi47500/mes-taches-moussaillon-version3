require 'test_helper'

class QueensgambitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get queensgambit_index_url
    assert_response :success
  end

  test "should get new" do
    get queensgambit_new_url
    assert_response :success
  end

end
