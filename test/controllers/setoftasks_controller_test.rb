require 'test_helper'

class SetoftasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setoftask = setoftasks(:one)
  end

  test "should get index" do
    get setoftasks_url
    assert_response :success
  end

  test "should get new" do
    get new_setoftask_url
    assert_response :success
  end

  test "should create setoftask" do
    assert_difference('Setoftask.count') do
      post setoftasks_url, params: { setoftask: { title: @setoftask.title } }
    end

    assert_redirected_to setoftask_url(Setoftask.last)
  end

  test "should show setoftask" do
    get setoftask_url(@setoftask)
    assert_response :success
  end

  test "should get edit" do
    get edit_setoftask_url(@setoftask)
    assert_response :success
  end

  test "should update setoftask" do
    patch setoftask_url(@setoftask), params: { setoftask: { title: @setoftask.title } }
    assert_redirected_to setoftask_url(@setoftask)
  end

  test "should destroy setoftask" do
    assert_difference('Setoftask.count', -1) do
      delete setoftask_url(@setoftask)
    end

    assert_redirected_to setoftasks_url
  end
end
