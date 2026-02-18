require 'test_helper'

class RsmaControllerTest < ActionDispatch::IntegrationTest
  test "should get wrongtask" do
    get rsma_wrongtask_url
    assert_response :success
  end

end
