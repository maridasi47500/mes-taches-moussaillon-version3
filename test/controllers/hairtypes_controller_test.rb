require 'test_helper'

class HairtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hairtype = hairtypes(:one)
  end

  test "should get index" do
    get hairtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_hairtype_url
    assert_response :success
  end

  test "should create hairtype" do
    assert_difference('Hairtype.count') do
      post hairtypes_url, params: { hairtype: { name: @hairtype.name } }
    end

    assert_redirected_to hairtype_url(Hairtype.last)
  end

  test "should show hairtype" do
    get hairtype_url(@hairtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_hairtype_url(@hairtype)
    assert_response :success
  end

  test "should update hairtype" do
    patch hairtype_url(@hairtype), params: { hairtype: { name: @hairtype.name } }
    assert_redirected_to hairtype_url(@hairtype)
  end

  test "should destroy hairtype" do
    assert_difference('Hairtype.count', -1) do
      delete hairtype_url(@hairtype)
    end

    assert_redirected_to hairtypes_url
  end
end
