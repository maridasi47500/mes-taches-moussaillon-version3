require 'test_helper'

class BodypartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bodypart = bodyparts(:one)
  end

  test "should get index" do
    get bodyparts_url
    assert_response :success
  end

  test "should get new" do
    get new_bodypart_url
    assert_response :success
  end

  test "should create bodypart" do
    assert_difference('Bodypart.count') do
      post bodyparts_url, params: { bodypart: { image: @bodypart.image, name_de: @bodypart.name_de, name_en: @bodypart.name_en, name_fr: @bodypart.name_fr } }
    end

    assert_redirected_to bodypart_url(Bodypart.last)
  end

  test "should show bodypart" do
    get bodypart_url(@bodypart)
    assert_response :success
  end

  test "should get edit" do
    get edit_bodypart_url(@bodypart)
    assert_response :success
  end

  test "should update bodypart" do
    patch bodypart_url(@bodypart), params: { bodypart: { image: @bodypart.image, name_de: @bodypart.name_de, name_en: @bodypart.name_en, name_fr: @bodypart.name_fr } }
    assert_redirected_to bodypart_url(@bodypart)
  end

  test "should destroy bodypart" do
    assert_difference('Bodypart.count', -1) do
      delete bodypart_url(@bodypart)
    end

    assert_redirected_to bodyparts_url
  end
end
