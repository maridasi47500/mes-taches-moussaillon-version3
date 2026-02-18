require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { address: @task.address, city_id: @task.city_id, end_at: @task.end_at, latitude: @task.latitude, longitude: @task.longitude, name: @task.name, place_id: @task.place_id, start_at: @task.start_at, state_id: @task.state_id } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { address: @task.address, city_id: @task.city_id, end_at: @task.end_at, latitude: @task.latitude, longitude: @task.longitude, name: @task.name, place_id: @task.place_id, start_at: @task.start_at, state_id: @task.state_id } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
