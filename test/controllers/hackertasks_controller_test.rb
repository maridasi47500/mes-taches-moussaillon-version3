require 'test_helper'

class HackertasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hackertask = hackertasks(:one)
  end

  test "should get index" do
    get hackertasks_url
    assert_response :success
  end

  test "should get new" do
    get new_hackertask_url
    assert_response :success
  end

  test "should create hackertask" do
    assert_difference('Hackertask.count') do
      post hackertasks_url, params: { hackertask: { name: @hackertask.name } }
    end

    assert_redirected_to hackertask_url(Hackertask.last)
  end

  test "should show hackertask" do
    get hackertask_url(@hackertask)
    assert_response :success
  end

  test "should get edit" do
    get edit_hackertask_url(@hackertask)
    assert_response :success
  end

  test "should update hackertask" do
    patch hackertask_url(@hackertask), params: { hackertask: { name: @hackertask.name } }
    assert_redirected_to hackertask_url(@hackertask)
  end

  test "should destroy hackertask" do
    assert_difference('Hackertask.count', -1) do
      delete hackertask_url(@hackertask)
    end

    assert_redirected_to hackertasks_url
  end
end
