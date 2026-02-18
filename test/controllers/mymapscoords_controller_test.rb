require 'test_helper'

class MymapscoordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mymapscoord = mymapscoords(:one)
  end

  test "should get index" do
    get mymapscoords_url
    assert_response :success
  end

  test "should get new" do
    get new_mymapscoord_url
    assert_response :success
  end

  test "should create mymapscoord" do
    assert_difference('Mymapscoord.count') do
      post mymapscoords_url, params: { mymapscoord: { mymap_id: @mymapscoord.mymap_id, tagx: @mymapscoord.tagx, tagy: @mymapscoord.tagy } }
    end

    assert_redirected_to mymapscoord_url(Mymapscoord.last)
  end

  test "should show mymapscoord" do
    get mymapscoord_url(@mymapscoord)
    assert_response :success
  end

  test "should get edit" do
    get edit_mymapscoord_url(@mymapscoord)
    assert_response :success
  end

  test "should update mymapscoord" do
    patch mymapscoord_url(@mymapscoord), params: { mymapscoord: { mymap_id: @mymapscoord.mymap_id, tagx: @mymapscoord.tagx, tagy: @mymapscoord.tagy } }
    assert_redirected_to mymapscoord_url(@mymapscoord)
  end

  test "should destroy mymapscoord" do
    assert_difference('Mymapscoord.count', -1) do
      delete mymapscoord_url(@mymapscoord)
    end

    assert_redirected_to mymapscoords_url
  end
end
