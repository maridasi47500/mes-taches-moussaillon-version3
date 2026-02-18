require 'test_helper'

class MadagascarControllerTest < ActionDispatch::IntegrationTest
  test "should get menage" do
    get madagascar_menage_url
    assert_response :success
  end

end
