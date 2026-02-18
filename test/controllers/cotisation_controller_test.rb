require 'test_helper'

class CotisationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cotisation_index_url
    assert_response :success
  end

end
