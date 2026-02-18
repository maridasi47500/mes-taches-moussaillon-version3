require 'test_helper'

class AregoodrequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aregoodrequest = aregoodrequests(:one)
  end

  test "should get index" do
    get aregoodrequests_url
    assert_response :success
  end

  test "should get new" do
    get new_aregoodrequest_url
    assert_response :success
  end

  test "should create aregoodrequest" do
    assert_difference('Aregoodrequest.count') do
      post aregoodrequests_url, params: { aregoodrequest: {  } }
    end

    assert_redirected_to aregoodrequest_url(Aregoodrequest.last)
  end

  test "should show aregoodrequest" do
    get aregoodrequest_url(@aregoodrequest)
    assert_response :success
  end

  test "should get edit" do
    get edit_aregoodrequest_url(@aregoodrequest)
    assert_response :success
  end

  test "should update aregoodrequest" do
    patch aregoodrequest_url(@aregoodrequest), params: { aregoodrequest: {  } }
    assert_redirected_to aregoodrequest_url(@aregoodrequest)
  end

  test "should destroy aregoodrequest" do
    assert_difference('Aregoodrequest.count', -1) do
      delete aregoodrequest_url(@aregoodrequest)
    end

    assert_redirected_to aregoodrequests_url
  end
end
