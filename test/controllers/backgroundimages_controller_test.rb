require 'test_helper'

class BackgroundimagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backgroundimage = backgroundimages(:one)
  end

  test "should get index" do
    get backgroundimages_url
    assert_response :success
  end

  test "should get new" do
    get new_backgroundimage_url
    assert_response :success
  end

  test "should create backgroundimage" do
    assert_difference('Backgroundimage.count') do
      post backgroundimages_url, params: { backgroundimage: { image: @backgroundimage.image, type: @backgroundimage.type, url: @backgroundimage.url } }
    end

    assert_redirected_to backgroundimage_url(Backgroundimage.last)
  end

  test "should show backgroundimage" do
    get backgroundimage_url(@backgroundimage)
    assert_response :success
  end

  test "should get edit" do
    get edit_backgroundimage_url(@backgroundimage)
    assert_response :success
  end

  test "should update backgroundimage" do
    patch backgroundimage_url(@backgroundimage), params: { backgroundimage: { image: @backgroundimage.image, type: @backgroundimage.type, url: @backgroundimage.url } }
    assert_redirected_to backgroundimage_url(@backgroundimage)
  end

  test "should destroy backgroundimage" do
    assert_difference('Backgroundimage.count', -1) do
      delete backgroundimage_url(@backgroundimage)
    end

    assert_redirected_to backgroundimages_url
  end
end
