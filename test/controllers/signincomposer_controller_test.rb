require 'test_helper'

class SignincomposerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get signincomposer_index_url
    assert_response :success
  end

end
