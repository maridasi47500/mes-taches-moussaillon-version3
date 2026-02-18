require 'test_helper'

class FacebookRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facebook_request = facebook_requests(:one)
  end

  test "should get index" do
    get facebook_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_facebook_request_url
    assert_response :success
  end

  test "should create facebook_request" do
    assert_difference('FacebookRequest.count') do
      post facebook_requests_url, params: { facebook_request: { name: @facebook_request.name } }
    end

    assert_redirected_to facebook_request_url(FacebookRequest.last)
  end

  test "should show facebook_request" do
    get facebook_request_url(@facebook_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_facebook_request_url(@facebook_request)
    assert_response :success
  end

  test "should update facebook_request" do
    patch facebook_request_url(@facebook_request), params: { facebook_request: { name: @facebook_request.name } }
    assert_redirected_to facebook_request_url(@facebook_request)
  end

  test "should destroy facebook_request" do
    assert_difference('FacebookRequest.count', -1) do
      delete facebook_request_url(@facebook_request)
    end

    assert_redirected_to facebook_requests_url
  end
end
