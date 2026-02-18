require 'test_helper'

class ClothesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clothing = clothes(:one)
  end

  test "should get index" do
    get clothes_url
    assert_response :success
  end

  test "should get new" do
    get new_clothing_url
    assert_response :success
  end

  test "should create clothing" do
    assert_difference('Clothing.count') do
      post clothes_url, params: { clothing: { image: @clothing.image, name: @clothing.name } }
    end

    assert_redirected_to clothing_url(Clothing.last)
  end

  test "should show clothing" do
    get clothing_url(@clothing)
    assert_response :success
  end

  test "should get edit" do
    get edit_clothing_url(@clothing)
    assert_response :success
  end

  test "should update clothing" do
    patch clothing_url(@clothing), params: { clothing: { image: @clothing.image, name: @clothing.name } }
    assert_redirected_to clothing_url(@clothing)
  end

  test "should destroy clothing" do
    assert_difference('Clothing.count', -1) do
      delete clothing_url(@clothing)
    end

    assert_redirected_to clothes_url
  end
end
