require 'test_helper'

class ScheduledtasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduledtask = scheduledtasks(:one)
  end

  test "should get index" do
    get scheduledtasks_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduledtask_url
    assert_response :success
  end

  test "should create scheduledtask" do
    assert_difference('Scheduledtask.count') do
      post scheduledtasks_url, params: { scheduledtask: { date_and_time: @scheduledtask.date_and_time, name: @scheduledtask.name, person_id: @scheduledtask.person_id } }
    end

    assert_redirected_to scheduledtask_url(Scheduledtask.last)
  end

  test "should show scheduledtask" do
    get scheduledtask_url(@scheduledtask)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduledtask_url(@scheduledtask)
    assert_response :success
  end

  test "should update scheduledtask" do
    patch scheduledtask_url(@scheduledtask), params: { scheduledtask: { date_and_time: @scheduledtask.date_and_time, name: @scheduledtask.name, person_id: @scheduledtask.person_id } }
    assert_redirected_to scheduledtask_url(@scheduledtask)
  end

  test "should destroy scheduledtask" do
    assert_difference('Scheduledtask.count', -1) do
      delete scheduledtask_url(@scheduledtask)
    end

    assert_redirected_to scheduledtasks_url
  end
end
