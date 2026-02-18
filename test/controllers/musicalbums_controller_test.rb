require 'test_helper'

class MusicalbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @musicalbum = musicalbums(:one)
  end

  test "should get index" do
    get musicalbums_url
    assert_response :success
  end

  test "should get new" do
    get new_musicalbum_url
    assert_response :success
  end

  test "should create musicalbum" do
    assert_difference('Musicalbum.count') do
      post musicalbums_url, params: { musicalbum: { image: @musicalbum.image, name: @musicalbum.name } }
    end

    assert_redirected_to musicalbum_url(Musicalbum.last)
  end

  test "should show musicalbum" do
    get musicalbum_url(@musicalbum)
    assert_response :success
  end

  test "should get edit" do
    get edit_musicalbum_url(@musicalbum)
    assert_response :success
  end

  test "should update musicalbum" do
    patch musicalbum_url(@musicalbum), params: { musicalbum: { image: @musicalbum.image, name: @musicalbum.name } }
    assert_redirected_to musicalbum_url(@musicalbum)
  end

  test "should destroy musicalbum" do
    assert_difference('Musicalbum.count', -1) do
      delete musicalbum_url(@musicalbum)
    end

    assert_redirected_to musicalbums_url
  end
end
