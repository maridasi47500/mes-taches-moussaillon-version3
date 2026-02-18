require 'test_helper'

class LifestateshaverequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lifestateshaverequest = lifestateshaverequests(:one)
  end

  test "should get index" do
    get lifestateshaverequests_url
    assert_response :success
  end

  test "should get new" do
    get new_lifestateshaverequest_url
    assert_response :success
  end

  test "should create lifestateshaverequest" do
    assert_difference('Lifestateshaverequest.count') do
      post lifestateshaverequests_url, params: { lifestateshaverequest: { personhavelifestate_id: @lifestateshaverequest.personhavelifestate_id, requeststoperson_id: @lifestateshaverequest.requeststoperson_id } }
    end

    assert_redirected_to lifestateshaverequest_url(Lifestateshaverequest.last)
  end

  test "should show lifestateshaverequest" do
    get lifestateshaverequest_url(@lifestateshaverequest)
    assert_response :success
  end

  test "should get edit" do
    get edit_lifestateshaverequest_url(@lifestateshaverequest)
    assert_response :success
  end

  test "should update lifestateshaverequest" do
    patch lifestateshaverequest_url(@lifestateshaverequest), params: { lifestateshaverequest: { personhavelifestate_id: @lifestateshaverequest.personhavelifestate_id, requeststoperson_id: @lifestateshaverequest.requeststoperson_id } }
    assert_redirected_to lifestateshaverequest_url(@lifestateshaverequest)
  end

  test "should destroy lifestateshaverequest" do
    assert_difference('Lifestateshaverequest.count', -1) do
      delete lifestateshaverequest_url(@lifestateshaverequest)
    end

    assert_redirected_to lifestateshaverequests_url
  end
end
