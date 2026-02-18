require 'test_helper'

class TaskusedstuffsControllerTest < ActionDispatch::IntegrationTest
  test "should get addpeoplelikethis" do
    get taskusedstuffs_addpeoplelikethis_url
    assert_response :success
  end

end
