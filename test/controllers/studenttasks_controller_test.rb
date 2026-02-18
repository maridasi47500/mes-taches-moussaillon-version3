require 'test_helper'

class StudenttasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get studenttasks_index_url
    assert_response :success
  end

  test "should get show" do
    get studenttasks_show_url
    assert_response :success
  end

end
