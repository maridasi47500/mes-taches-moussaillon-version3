require 'test_helper'

class RecordingreviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recordingreview = recordingreviews(:one)
  end

  test "should get index" do
    get recordingreviews_url
    assert_response :success
  end

  test "should get new" do
    get new_recordingreview_url
    assert_response :success
  end

  test "should create recordingreview" do
    assert_difference('Recordingreview.count') do
      post recordingreviews_url, params: { recordingreview: { correctsampleid: @recordingreview.correctsampleid, gooduser_id: @recordingreview.gooduser_id, incorrectsample_id: @recordingreview.incorrectsample_id } }
    end

    assert_redirected_to recordingreview_url(Recordingreview.last)
  end

  test "should show recordingreview" do
    get recordingreview_url(@recordingreview)
    assert_response :success
  end

  test "should get edit" do
    get edit_recordingreview_url(@recordingreview)
    assert_response :success
  end

  test "should update recordingreview" do
    patch recordingreview_url(@recordingreview), params: { recordingreview: { correctsampleid: @recordingreview.correctsampleid, gooduser_id: @recordingreview.gooduser_id, incorrectsample_id: @recordingreview.incorrectsample_id } }
    assert_redirected_to recordingreview_url(@recordingreview)
  end

  test "should destroy recordingreview" do
    assert_difference('Recordingreview.count', -1) do
      delete recordingreview_url(@recordingreview)
    end

    assert_redirected_to recordingreviews_url
  end
end
