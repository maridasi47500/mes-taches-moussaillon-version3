require 'test_helper'

class BecausetasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @becausetask = becausetasks(:one)
  end

  test "should get index" do
    get becausetasks_url
    assert_response :success
  end

  test "should get new" do
    get new_becausetask_url
    assert_response :success
  end

  test "should create becausetask" do
    assert_difference('Becausetask.count') do
      post becausetasks_url, params: { becausetask: { othertask_id: @becausetask.othertask_id, task_id: @becausetask.task_id } }
    end

    assert_redirected_to becausetask_url(Becausetask.last)
  end

  test "should show becausetask" do
    get becausetask_url(@becausetask)
    assert_response :success
  end

  test "should get edit" do
    get edit_becausetask_url(@becausetask)
    assert_response :success
  end

  test "should update becausetask" do
    patch becausetask_url(@becausetask), params: { becausetask: { othertask_id: @becausetask.othertask_id, task_id: @becausetask.task_id } }
    assert_redirected_to becausetask_url(@becausetask)
  end

  test "should destroy becausetask" do
    assert_difference('Becausetask.count', -1) do
      delete becausetask_url(@becausetask)
    end

    assert_redirected_to becausetasks_url
  end
end
