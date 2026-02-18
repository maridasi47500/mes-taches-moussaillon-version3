require 'test_helper'

class TvseriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tvseries = tvseries(:one)
  end

  test "should get index" do
    get tvseries_index_url
    assert_response :success
  end

  test "should get new" do
    get new_tvseries_url
    assert_response :success
  end

  test "should create tvseries" do
    assert_difference('Tvseries.count') do
      post tvseries_index_url, params: { tvseries: { description: @tvseries.description, image: @tvseries.image, name: @tvseries.name } }
    end

    assert_redirected_to tvseries_url(Tvseries.last)
  end

  test "should show tvseries" do
    get tvseries_url(@tvseries)
    assert_response :success
  end

  test "should get edit" do
    get edit_tvseries_url(@tvseries)
    assert_response :success
  end

  test "should update tvseries" do
    patch tvseries_url(@tvseries), params: { tvseries: { description: @tvseries.description, image: @tvseries.image, name: @tvseries.name } }
    assert_redirected_to tvseries_url(@tvseries)
  end

  test "should destroy tvseries" do
    assert_difference('Tvseries.count', -1) do
      delete tvseries_url(@tvseries)
    end

    assert_redirected_to tvseries_index_url
  end
end
