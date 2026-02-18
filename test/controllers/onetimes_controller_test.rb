require 'test_helper'

class OnetimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onetime = onetimes(:one)
  end

  test "should get index" do
    get onetimes_url
    assert_response :success
  end

  test "should get new" do
    get new_onetime_url
    assert_response :success
  end

  test "should create onetime" do
    assert_difference('Onetime.count') do
      post onetimes_url, params: { onetime: { content: @onetime.content, pronoun_id: @onetime.pronoun_id } }
    end

    assert_redirected_to onetime_url(Onetime.last)
  end

  test "should show onetime" do
    get onetime_url(@onetime)
    assert_response :success
  end

  test "should get edit" do
    get edit_onetime_url(@onetime)
    assert_response :success
  end

  test "should update onetime" do
    patch onetime_url(@onetime), params: { onetime: { content: @onetime.content, pronoun_id: @onetime.pronoun_id } }
    assert_redirected_to onetime_url(@onetime)
  end

  test "should destroy onetime" do
    assert_difference('Onetime.count', -1) do
      delete onetime_url(@onetime)
    end

    assert_redirected_to onetimes_url
  end
end
