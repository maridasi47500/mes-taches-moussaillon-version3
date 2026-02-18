require 'test_helper'

class IntegreControllerTest < ActionDispatch::IntegrationTest
  test "should get armee" do
    get integre_armee_url
    assert_response :success
  end

end
