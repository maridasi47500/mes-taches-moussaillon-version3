require 'test_helper'

class HaircolorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @haircolor = haircolors(:one)
  end

  test "should get index" do
    get haircolors_url
    assert_response :success
  end

  test "should get new" do
    get new_haircolor_url
    assert_response :success
  end

  test "should create haircolor" do
    assert_difference('Haircolor.count') do
      post haircolors_url, params: { haircolor: { name: @haircolor.name } }
    end

    assert_redirected_to haircolor_url(Haircolor.last)
  end

  test "should show haircolor" do
    get haircolor_url(@haircolor)
    assert_response :success
  end

  test "should get edit" do
    get edit_haircolor_url(@haircolor)
    assert_response :success
  end

  test "should update haircolor" do
    patch haircolor_url(@haircolor), params: { haircolor: { name: @haircolor.name } }
    assert_redirected_to haircolor_url(@haircolor)
  end

  test "should destroy haircolor" do
    assert_difference('Haircolor.count', -1) do
      delete haircolor_url(@haircolor)
    end

    assert_redirected_to haircolors_url
  end
end
