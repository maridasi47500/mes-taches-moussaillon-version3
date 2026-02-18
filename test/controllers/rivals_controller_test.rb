require 'test_helper'

class RivalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rival = rivals(:one)
  end

  test "should get index" do
    get rivals_url
    assert_response :success
  end

  test "should get new" do
    get new_rival_url
    assert_response :success
  end

  test "should create rival" do
    assert_difference('Rival.count') do
      post rivals_url, params: { rival: { fakelover_id: @rival.fakelover_id, reallover_id: @rival.reallover_id } }
    end

    assert_redirected_to rival_url(Rival.last)
  end

  test "should show rival" do
    get rival_url(@rival)
    assert_response :success
  end

  test "should get edit" do
    get edit_rival_url(@rival)
    assert_response :success
  end

  test "should update rival" do
    patch rival_url(@rival), params: { rival: { fakelover_id: @rival.fakelover_id, reallover_id: @rival.reallover_id } }
    assert_redirected_to rival_url(@rival)
  end

  test "should destroy rival" do
    assert_difference('Rival.count', -1) do
      delete rival_url(@rival)
    end

    assert_redirected_to rivals_url
  end
end
