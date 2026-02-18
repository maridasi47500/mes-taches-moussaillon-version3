require 'test_helper'

class DessinerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dessiner_index_url
    assert_response :success
  end

end
