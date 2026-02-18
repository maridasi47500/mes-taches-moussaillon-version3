require 'test_helper'

class ClothescolorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clothescolor = clothescolors(:one)
  end

  test "should get index" do
    get clothescolors_url
    assert_response :success
  end

  test "should get new" do
    get new_clothescolor_url
    assert_response :success
  end

  test "should create clothescolor" do
    assert_difference('Clothescolor.count') do
      post clothescolors_url, params: { clothescolor: { name: @clothescolor.name } }
    end

    assert_redirected_to clothescolor_url(Clothescolor.last)
  end

  test "should show clothescolor" do
    get clothescolor_url(@clothescolor)
    assert_response :success
  end

  test "should get edit" do
    get edit_clothescolor_url(@clothescolor)
    assert_response :success
  end

  test "should update clothescolor" do
    patch clothescolor_url(@clothescolor), params: { clothescolor: { name: @clothescolor.name } }
    assert_redirected_to clothescolor_url(@clothescolor)
  end

  test "should destroy clothescolor" do
    assert_difference('Clothescolor.count', -1) do
      delete clothescolor_url(@clothescolor)
    end

    assert_redirected_to clothescolors_url
  end
end
