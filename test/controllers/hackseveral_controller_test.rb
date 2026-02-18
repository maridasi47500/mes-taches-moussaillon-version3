require 'test_helper'

class HackseveralControllerTest < ActionDispatch::IntegrationTest
  test "should get people" do
    get hackseveral_people_url
    assert_response :success
  end

end
