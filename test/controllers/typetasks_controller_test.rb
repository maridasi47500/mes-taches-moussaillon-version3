require 'test_helper'

class TypetasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @typetask = typetasks(:one)
  end

  test "should get index" do
    get typetasks_url
    assert_response :success
  end

  test "should get new" do
    get new_typetask_url
    assert_response :success
  end

  test "should create typetask" do
    assert_difference('Typetask.count') do
      post typetasks_url, params: { typetask: { image: @typetask.image, name: @typetask.name } }
    end

    assert_redirected_to typetask_url(Typetask.last)
  end

  test "should show typetask" do
    get typetask_url(@typetask)
    assert_response :success
  end

  test "should get edit" do
    get edit_typetask_url(@typetask)
    assert_response :success
  end

  test "should update typetask" do
    patch typetask_url(@typetask), params: { typetask: { image: @typetask.image, name: @typetask.name } }
    assert_redirected_to typetask_url(@typetask)
  end

  test "should destroy typetask" do
    assert_difference('Typetask.count', -1) do
      delete typetask_url(@typetask)
    end

    assert_redirected_to typetasks_url
  end
end
