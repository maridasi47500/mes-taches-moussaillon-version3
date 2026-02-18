require 'test_helper'

class SkinTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skin_type = skin_types(:one)
  end

  test "should get index" do
    get skin_types_url
    assert_response :success
  end

  test "should get new" do
    get new_skin_type_url
    assert_response :success
  end

  test "should create skin_type" do
    assert_difference('SkinType.count') do
      post skin_types_url, params: { skin_type: { name: @skin_type.name } }
    end

    assert_redirected_to skin_type_url(SkinType.last)
  end

  test "should show skin_type" do
    get skin_type_url(@skin_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_skin_type_url(@skin_type)
    assert_response :success
  end

  test "should update skin_type" do
    patch skin_type_url(@skin_type), params: { skin_type: { name: @skin_type.name } }
    assert_redirected_to skin_type_url(@skin_type)
  end

  test "should destroy skin_type" do
    assert_difference('SkinType.count', -1) do
      delete skin_type_url(@skin_type)
    end

    assert_redirected_to skin_types_url
  end
end
