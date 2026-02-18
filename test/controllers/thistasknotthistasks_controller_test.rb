require 'test_helper'

class ThistasknotthistasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thistasknotthistask = thistasknotthistasks(:one)
  end

  test "should get index" do
    get thistasknotthistasks_url
    assert_response :success
  end

  test "should get new" do
    get new_thistasknotthistask_url
    assert_response :success
  end

  test "should create thistasknotthistask" do
    assert_difference('Thistasknotthistask.count') do
      post thistasknotthistasks_url, params: { thistasknotthistask: { othertask_id: @thistasknotthistask.othertask_id, task_id: @thistasknotthistask.task_id } }
    end

    assert_redirected_to thistasknotthistask_url(Thistasknotthistask.last)
  end

  test "should show thistasknotthistask" do
    get thistasknotthistask_url(@thistasknotthistask)
    assert_response :success
  end

  test "should get edit" do
    get edit_thistasknotthistask_url(@thistasknotthistask)
    assert_response :success
  end

  test "should update thistasknotthistask" do
    patch thistasknotthistask_url(@thistasknotthistask), params: { thistasknotthistask: { othertask_id: @thistasknotthistask.othertask_id, task_id: @thistasknotthistask.task_id } }
    assert_redirected_to thistasknotthistask_url(@thistasknotthistask)
  end

  test "should destroy thistasknotthistask" do
    assert_difference('Thistasknotthistask.count', -1) do
      delete thistasknotthistask_url(@thistasknotthistask)
    end

    assert_redirected_to thistasknotthistasks_url
  end
end
