require 'test_helper'

class LaundrycaptainsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get laundrycaptains_show_url
    assert_response :success
  end

end
