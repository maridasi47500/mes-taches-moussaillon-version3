require 'test_helper'

class CategorythingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categorything = categorythings(:one)
  end

  test "should get index" do
    get categorythings_url
    assert_response :success
  end

  test "should get new" do
    get new_categorything_url
    assert_response :success
  end

  test "should create categorything" do
    assert_difference('Categorything.count') do
      post categorythings_url, params: { categorything: { image: @categorything.image, name_de: @categorything.name_de, name_en: @categorything.name_en, name_fr: @categorything.name_fr } }
    end

    assert_redirected_to categorything_url(Categorything.last)
  end

  test "should show categorything" do
    get categorything_url(@categorything)
    assert_response :success
  end

  test "should get edit" do
    get edit_categorything_url(@categorything)
    assert_response :success
  end

  test "should update categorything" do
    patch categorything_url(@categorything), params: { categorything: { image: @categorything.image, name_de: @categorything.name_de, name_en: @categorything.name_en, name_fr: @categorything.name_fr } }
    assert_redirected_to categorything_url(@categorything)
  end

  test "should destroy categorything" do
    assert_difference('Categorything.count', -1) do
      delete categorything_url(@categorything)
    end

    assert_redirected_to categorythings_url
  end
end
