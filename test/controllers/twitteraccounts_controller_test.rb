require 'test_helper'

class TwitteraccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twitteraccount = twitteraccounts(:one)
  end

  test "should get index" do
    get twitteraccounts_url
    assert_response :success
  end

  test "should get new" do
    get new_twitteraccount_url
    assert_response :success
  end

  test "should create twitteraccount" do
    assert_difference('Twitteraccount.count') do
      post twitteraccounts_url, params: { twitteraccount: { name: @twitteraccount.name, username: @twitteraccount.username } }
    end

    assert_redirected_to twitteraccount_url(Twitteraccount.last)
  end

  test "should show twitteraccount" do
    get twitteraccount_url(@twitteraccount)
    assert_response :success
  end

  test "should get edit" do
    get edit_twitteraccount_url(@twitteraccount)
    assert_response :success
  end

  test "should update twitteraccount" do
    patch twitteraccount_url(@twitteraccount), params: { twitteraccount: { name: @twitteraccount.name, username: @twitteraccount.username } }
    assert_redirected_to twitteraccount_url(@twitteraccount)
  end

  test "should destroy twitteraccount" do
    assert_difference('Twitteraccount.count', -1) do
      delete twitteraccount_url(@twitteraccount)
    end

    assert_redirected_to twitteraccounts_url
  end
end
