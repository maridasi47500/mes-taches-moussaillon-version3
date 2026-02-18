require 'test_helper'

class SkinColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skin_color = skin_colors(:one)
  end

  test "should get index" do
    get skin_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_skin_color_url
    assert_response :success
  end

  test "should create skin_color" do
    assert_difference('SkinColor.count') do
      post skin_colors_url, params: { skin_color: { name: @skin_color.name } }
    end

    assert_redirected_to skin_color_url(SkinColor.last)
  end

  test "should show skin_color" do
    get skin_color_url(@skin_color)
    assert_response :success
  end

  test "should get edit" do
    get edit_skin_color_url(@skin_color)
    assert_response :success
  end

  test "should update skin_color" do
    patch skin_color_url(@skin_color), params: { skin_color: { name: @skin_color.name } }
    assert_redirected_to skin_color_url(@skin_color)
  end

  test "should destroy skin_color" do
    assert_difference('SkinColor.count', -1) do
      delete skin_color_url(@skin_color)
    end

    assert_redirected_to skin_colors_url
  end
end
