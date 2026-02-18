require 'test_helper'

class TorealizetasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @torealizetask = torealizetasks(:one)
  end

  test "should get index" do
    get torealizetasks_url
    assert_response :success
  end

  test "should get new" do
    get new_torealizetask_url
    assert_response :success
  end

  test "should create torealizetask" do
    assert_difference('Torealizetask.count') do
      post torealizetasks_url, params: { torealizetask: { task_id: @torealizetask.task_id, user_id: @torealizetask.user_id } }
    end

    assert_redirected_to torealizetask_url(Torealizetask.last)
  end

  test "should show torealizetask" do
    get torealizetask_url(@torealizetask)
    assert_response :success
  end

  test "should get edit" do
    get edit_torealizetask_url(@torealizetask)
    assert_response :success
  end

  test "should update torealizetask" do
    patch torealizetask_url(@torealizetask), params: { torealizetask: { task_id: @torealizetask.task_id, user_id: @torealizetask.user_id } }
    assert_redirected_to torealizetask_url(@torealizetask)
  end

  test "should destroy torealizetask" do
    assert_difference('Torealizetask.count', -1) do
      delete torealizetask_url(@torealizetask)
    end

    assert_redirected_to torealizetasks_url
  end
end
