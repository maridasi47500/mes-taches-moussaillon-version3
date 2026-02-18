require 'test_helper'

class FilmparodiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @filmparody = filmparodies(:one)
  end

  test "should get index" do
    get filmparodies_url
    assert_response :success
  end

  test "should get new" do
    get new_filmparody_url
    assert_response :success
  end

  test "should create filmparody" do
    assert_difference('Filmparodie.count') do
      post filmparodies_url, params: { filmparody: { image: @filmparody.image, name_de: @filmparody.name_de, name_en: @filmparody.name_en, name_fr: @filmparody.name_fr } }
    end

    assert_redirected_to filmparody_url(Filmparodie.last)
  end

  test "should show filmparody" do
    get filmparody_url(@filmparody)
    assert_response :success
  end

  test "should get edit" do
    get edit_filmparody_url(@filmparody)
    assert_response :success
  end

  test "should update filmparody" do
    patch filmparody_url(@filmparody), params: { filmparody: { image: @filmparody.image, name_de: @filmparody.name_de, name_en: @filmparody.name_en, name_fr: @filmparody.name_fr } }
    assert_redirected_to filmparody_url(@filmparody)
  end

  test "should destroy filmparody" do
    assert_difference('Filmparodie.count', -1) do
      delete filmparody_url(@filmparody)
    end

    assert_redirected_to filmparodies_url
  end
end
