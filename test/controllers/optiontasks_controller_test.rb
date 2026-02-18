require 'test_helper'

class OptiontasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @optiontask = optiontasks(:one)
  end

  test "should get index" do
    get optiontasks_url
    assert_response :success
  end

  test "should get new" do
    get new_optiontask_url
    assert_response :success
  end

  test "should create optiontask" do
    assert_difference('Optiontask.count') do
      post optiontasks_url, params: { optiontask: { optiontask_id: @optiontask.optiontask_id, task_id: @optiontask.task_id } }
    end

    assert_redirected_to optiontask_url(Optiontask.last)
  end

  test "should show optiontask" do
    get optiontask_url(@optiontask)
    assert_response :success
  end

  test "should get edit" do
    get edit_optiontask_url(@optiontask)
    assert_response :success
  end

  test "should update optiontask" do
    patch optiontask_url(@optiontask), params: { optiontask: { optiontask_id: @optiontask.optiontask_id, task_id: @optiontask.task_id } }
    assert_redirected_to optiontask_url(@optiontask)
  end

  test "should destroy optiontask" do
    assert_difference('Optiontask.count', -1) do
      delete optiontask_url(@optiontask)
    end

    assert_redirected_to optiontasks_url
  end
end
