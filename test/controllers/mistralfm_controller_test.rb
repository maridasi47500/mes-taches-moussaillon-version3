require 'test_helper'

class MistralfmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mistralfm_index_url
    assert_response :success
  end

end
