require 'test_helper'

class GoogleRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @google_request = google_requests(:one)
  end

  test "should get index" do
    get google_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_google_request_url
    assert_response :success
  end

  test "should create google_request" do
    assert_difference('GoogleRequest.count') do
      post google_requests_url, params: { google_request: { name: @google_request.name } }
    end

    assert_redirected_to google_request_url(GoogleRequest.last)
  end

  test "should show google_request" do
    get google_request_url(@google_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_google_request_url(@google_request)
    assert_response :success
  end

  test "should update google_request" do
    patch google_request_url(@google_request), params: { google_request: { name: @google_request.name } }
    assert_redirected_to google_request_url(@google_request)
  end

  test "should destroy google_request" do
    assert_difference('GoogleRequest.count', -1) do
      delete google_request_url(@google_request)
    end

    assert_redirected_to google_requests_url
  end
end
