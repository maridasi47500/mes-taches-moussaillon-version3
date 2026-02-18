require 'test_helper'

class TaskshaveaccomplishmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taskshaveaccomplishment = taskshaveaccomplishments(:one)
  end

  test "should get index" do
    get taskshaveaccomplishments_url
    assert_response :success
  end

  test "should get new" do
    get new_taskshaveaccomplishment_url
    assert_response :success
  end

  test "should create taskshaveaccomplishment" do
    assert_difference('Taskshaveaccomplishment.count') do
      post taskshaveaccomplishments_url, params: { taskshaveaccomplishment: { sailor_id: @taskshaveaccomplishment.sailor_id, task_id: @taskshaveaccomplishment.task_id, ticket_id: @taskshaveaccomplishment.ticket_id } }
    end

    assert_redirected_to taskshaveaccomplishment_url(Taskshaveaccomplishment.last)
  end

  test "should show taskshaveaccomplishment" do
    get taskshaveaccomplishment_url(@taskshaveaccomplishment)
    assert_response :success
  end

  test "should get edit" do
    get edit_taskshaveaccomplishment_url(@taskshaveaccomplishment)
    assert_response :success
  end

  test "should update taskshaveaccomplishment" do
    patch taskshaveaccomplishment_url(@taskshaveaccomplishment), params: { taskshaveaccomplishment: { sailor_id: @taskshaveaccomplishment.sailor_id, task_id: @taskshaveaccomplishment.task_id, ticket_id: @taskshaveaccomplishment.ticket_id } }
    assert_redirected_to taskshaveaccomplishment_url(@taskshaveaccomplishment)
  end

  test "should destroy taskshaveaccomplishment" do
    assert_difference('Taskshaveaccomplishment.count', -1) do
      delete taskshaveaccomplishment_url(@taskshaveaccomplishment)
    end

    assert_redirected_to taskshaveaccomplishments_url
  end
end
