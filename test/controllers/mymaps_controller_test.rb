require 'test_helper'

class MymapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mymap = mymaps(:one)
  end

  test "should get index" do
    get mymaps_url
    assert_response :success
  end

  test "should get new" do
    get new_mymap_url
    assert_response :success
  end

  test "should create mymap" do
    assert_difference('Mymap.count') do
      post mymaps_url, params: { mymap: { height: @mymap.height, image: @mymap.image, width: @mymap.width } }
    end

    assert_redirected_to mymap_url(Mymap.last)
  end

  test "should show mymap" do
    get mymap_url(@mymap)
    assert_response :success
  end

  test "should get edit" do
    get edit_mymap_url(@mymap)
    assert_response :success
  end

  test "should update mymap" do
    patch mymap_url(@mymap), params: { mymap: { height: @mymap.height, image: @mymap.image, width: @mymap.width } }
    assert_redirected_to mymap_url(@mymap)
  end

  test "should destroy mymap" do
    assert_difference('Mymap.count', -1) do
      delete mymap_url(@mymap)
    end

    assert_redirected_to mymaps_url
  end
end
