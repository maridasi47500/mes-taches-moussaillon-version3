require 'test_helper'

class SignupcomposerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get signupcomposer_index_url
    assert_response :success
  end

end
