require 'test_helper'

class TasksailorusedstuffsControllerTest < ActionDispatch::IntegrationTest
  test "should get addpeopleforwho" do
    get tasksailorusedstuffs_addpeopleforwho_url
    assert_response :success
  end

  test "should get forwho" do
    get tasksailorusedstuffs_forwho_url
    assert_response :success
  end

end
