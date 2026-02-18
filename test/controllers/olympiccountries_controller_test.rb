require 'test_helper'

class OlympiccountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get olympiccountries_index_url
    assert_response :success
  end

end
