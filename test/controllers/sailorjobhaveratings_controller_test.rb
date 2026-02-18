require 'test_helper'

class SailorjobhaveratingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sailorjobhaverating = sailorjobhaveratings(:one)
  end

  test "should get index" do
    get sailorjobhaveratings_url
    assert_response :success
  end

  test "should get new" do
    get new_sailorjobhaverating_url
    assert_response :success
  end

  test "should create sailorjobhaverating" do
    assert_difference('Sailorjobhaverating.count') do
      post sailorjobhaveratings_url, params: { sailorjobhaverating: { datetime: @sailorjobhaverating.datetime, rating: @sailorjobhaverating.rating, sailorjob_id: @sailorjobhaverating.sailorjob_id, user_id: @sailorjobhaverating.user_id } }
    end

    assert_redirected_to sailorjobhaverating_url(Sailorjobhaverating.last)
  end

  test "should show sailorjobhaverating" do
    get sailorjobhaverating_url(@sailorjobhaverating)
    assert_response :success
  end

  test "should get edit" do
    get edit_sailorjobhaverating_url(@sailorjobhaverating)
    assert_response :success
  end

  test "should update sailorjobhaverating" do
    patch sailorjobhaverating_url(@sailorjobhaverating), params: { sailorjobhaverating: { datetime: @sailorjobhaverating.datetime, rating: @sailorjobhaverating.rating, sailorjob_id: @sailorjobhaverating.sailorjob_id, user_id: @sailorjobhaverating.user_id } }
    assert_redirected_to sailorjobhaverating_url(@sailorjobhaverating)
  end

  test "should destroy sailorjobhaverating" do
    assert_difference('Sailorjobhaverating.count', -1) do
      delete sailorjobhaverating_url(@sailorjobhaverating)
    end

    assert_redirected_to sailorjobhaveratings_url
  end
end
