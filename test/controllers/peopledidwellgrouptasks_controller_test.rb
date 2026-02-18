require 'test_helper'

class PeopledidwellgrouptasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peopledidwellgrouptask = peopledidwellgrouptasks(:one)
  end

  test "should get index" do
    get peopledidwellgrouptasks_url
    assert_response :success
  end

  test "should get new" do
    get new_peopledidwellgrouptask_url
    assert_response :success
  end

  test "should create peopledidwellgrouptask" do
    assert_difference('Peopledidwellgrouptask.count') do
      post peopledidwellgrouptasks_url, params: { peopledidwellgrouptask: { rating: @peopledidwellgrouptask.rating, sailorgrouptask_id: @peopledidwellgrouptask.sailorgrouptask_id, user_id: @peopledidwellgrouptask.user_id } }
    end

    assert_redirected_to peopledidwellgrouptask_url(Peopledidwellgrouptask.last)
  end

  test "should show peopledidwellgrouptask" do
    get peopledidwellgrouptask_url(@peopledidwellgrouptask)
    assert_response :success
  end

  test "should get edit" do
    get edit_peopledidwellgrouptask_url(@peopledidwellgrouptask)
    assert_response :success
  end

  test "should update peopledidwellgrouptask" do
    patch peopledidwellgrouptask_url(@peopledidwellgrouptask), params: { peopledidwellgrouptask: { rating: @peopledidwellgrouptask.rating, sailorgrouptask_id: @peopledidwellgrouptask.sailorgrouptask_id, user_id: @peopledidwellgrouptask.user_id } }
    assert_redirected_to peopledidwellgrouptask_url(@peopledidwellgrouptask)
  end

  test "should destroy peopledidwellgrouptask" do
    assert_difference('Peopledidwellgrouptask.count', -1) do
      delete peopledidwellgrouptask_url(@peopledidwellgrouptask)
    end

    assert_redirected_to peopledidwellgrouptasks_url
  end
end
