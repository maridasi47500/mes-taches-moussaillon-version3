require 'test_helper'

class AttitudesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attitude = attitudes(:one)
  end

  test "should get index" do
    get attitudes_url
    assert_response :success
  end

  test "should get new" do
    get new_attitude_url
    assert_response :success
  end

  test "should create attitude" do
    assert_difference('Attitude.count') do
      post attitudes_url, params: { attitude: {  } }
    end

    assert_redirected_to attitude_url(Attitude.last)
  end

  test "should show attitude" do
    get attitude_url(@attitude)
    assert_response :success
  end

  test "should get edit" do
    get edit_attitude_url(@attitude)
    assert_response :success
  end

  test "should update attitude" do
    patch attitude_url(@attitude), params: { attitude: {  } }
    assert_redirected_to attitude_url(@attitude)
  end

  test "should destroy attitude" do
    assert_difference('Attitude.count', -1) do
      delete attitude_url(@attitude)
    end

    assert_redirected_to attitudes_url
  end
end
