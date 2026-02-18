require 'test_helper'

class BarreviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barreview = barreviews(:one)
  end

  test "should get index" do
    get barreviews_url
    assert_response :success
  end

  test "should get new" do
    get new_barreview_url
    assert_response :success
  end

  test "should create barreview" do
    assert_difference('Barreview.count') do
      post barreviews_url, params: { barreview: { barattempt_id: @barreview.barattempt_id, description: @barreview.description, user_id: @barreview.user_id } }
    end

    assert_redirected_to barreview_url(Barreview.last)
  end

  test "should show barreview" do
    get barreview_url(@barreview)
    assert_response :success
  end

  test "should get edit" do
    get edit_barreview_url(@barreview)
    assert_response :success
  end

  test "should update barreview" do
    patch barreview_url(@barreview), params: { barreview: { barattempt_id: @barreview.barattempt_id, description: @barreview.description, user_id: @barreview.user_id } }
    assert_redirected_to barreview_url(@barreview)
  end

  test "should destroy barreview" do
    assert_difference('Barreview.count', -1) do
      delete barreview_url(@barreview)
    end

    assert_redirected_to barreviews_url
  end
end
