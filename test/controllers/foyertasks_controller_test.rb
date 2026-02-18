require 'test_helper'

class FoyertasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foyertask = foyertasks(:one)
  end

  test "should get index" do
    get foyertasks_url
    assert_response :success
  end

  test "should get new" do
    get new_foyertask_url
    assert_response :success
  end

  test "should create foyertask" do
    assert_difference('Foyertask.count') do
      post foyertasks_url, params: { foyertask: { task: @foyertask.task, user1: @foyertask.user1, user2: @foyertask.user2 } }
    end

    assert_redirected_to foyertask_url(Foyertask.last)
  end

  test "should show foyertask" do
    get foyertask_url(@foyertask)
    assert_response :success
  end

  test "should get edit" do
    get edit_foyertask_url(@foyertask)
    assert_response :success
  end

  test "should update foyertask" do
    patch foyertask_url(@foyertask), params: { foyertask: { task: @foyertask.task, user1: @foyertask.user1, user2: @foyertask.user2 } }
    assert_redirected_to foyertask_url(@foyertask)
  end

  test "should destroy foyertask" do
    assert_difference('Foyertask.count', -1) do
      delete foyertask_url(@foyertask)
    end

    assert_redirected_to foyertasks_url
  end
end
