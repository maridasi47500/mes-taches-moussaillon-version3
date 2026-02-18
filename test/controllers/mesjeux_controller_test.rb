require 'test_helper'

class MesjeuxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mesjeux_index_url
    assert_response :success
  end

end
