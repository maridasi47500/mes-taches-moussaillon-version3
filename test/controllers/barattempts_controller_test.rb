require 'test_helper'

class BarattemptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barattempt = barattempts(:one)
  end

  test "should get index" do
    get barattempts_url
    assert_response :success
  end

  test "should get new" do
    get new_barattempt_url
    assert_response :success
  end

  test "should create barattempt" do
    assert_difference('Barattempt.count') do
      post barattempts_url, params: { barattempt: { bar_id: @barattempt.bar_id, person_id: @barattempt.person_id, score_id: @barattempt.score_id, user_id: @barattempt.user_id } }
    end

    assert_redirected_to barattempt_url(Barattempt.last)
  end

  test "should show barattempt" do
    get barattempt_url(@barattempt)
    assert_response :success
  end

  test "should get edit" do
    get edit_barattempt_url(@barattempt)
    assert_response :success
  end

  test "should update barattempt" do
    patch barattempt_url(@barattempt), params: { barattempt: { bar_id: @barattempt.bar_id, person_id: @barattempt.person_id, score_id: @barattempt.score_id, user_id: @barattempt.user_id } }
    assert_redirected_to barattempt_url(@barattempt)
  end

  test "should destroy barattempt" do
    assert_difference('Barattempt.count', -1) do
      delete barattempt_url(@barattempt)
    end

    assert_redirected_to barattempts_url
  end
end
