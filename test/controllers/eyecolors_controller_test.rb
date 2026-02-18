require 'test_helper'

class EyecolorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eyecolor = eyecolors(:one)
  end

  test "should get index" do
    get eyecolors_url
    assert_response :success
  end

  test "should get new" do
    get new_eyecolor_url
    assert_response :success
  end

  test "should create eyecolor" do
    assert_difference('Eyecolor.count') do
      post eyecolors_url, params: { eyecolor: { name: @eyecolor.name } }
    end

    assert_redirected_to eyecolor_url(Eyecolor.last)
  end

  test "should show eyecolor" do
    get eyecolor_url(@eyecolor)
    assert_response :success
  end

  test "should get edit" do
    get edit_eyecolor_url(@eyecolor)
    assert_response :success
  end

  test "should update eyecolor" do
    patch eyecolor_url(@eyecolor), params: { eyecolor: { name: @eyecolor.name } }
    assert_redirected_to eyecolor_url(@eyecolor)
  end

  test "should destroy eyecolor" do
    assert_difference('Eyecolor.count', -1) do
      delete eyecolor_url(@eyecolor)
    end

    assert_redirected_to eyecolors_url
  end
end
