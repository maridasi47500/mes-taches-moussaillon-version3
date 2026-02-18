require 'test_helper'

class TasktypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tasktype = tasktypes(:one)
  end

  test "should get index" do
    get tasktypes_url
    assert_response :success
  end

  test "should get new" do
    get new_tasktype_url
    assert_response :success
  end

  test "should create tasktype" do
    assert_difference('Tasktype.count') do
      post tasktypes_url, params: { tasktype: { image: @tasktype.image, name: @tasktype.name } }
    end

    assert_redirected_to tasktype_url(Tasktype.last)
  end

  test "should show tasktype" do
    get tasktype_url(@tasktype)
    assert_response :success
  end

  test "should get edit" do
    get edit_tasktype_url(@tasktype)
    assert_response :success
  end

  test "should update tasktype" do
    patch tasktype_url(@tasktype), params: { tasktype: { image: @tasktype.image, name: @tasktype.name } }
    assert_redirected_to tasktype_url(@tasktype)
  end

  test "should destroy tasktype" do
    assert_difference('Tasktype.count', -1) do
      delete tasktype_url(@tasktype)
    end

    assert_redirected_to tasktypes_url
  end
end
