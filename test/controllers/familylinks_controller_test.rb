require 'test_helper'

class FamilylinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @familylink = familylinks(:one)
  end

  test "should get index" do
    get familylinks_url
    assert_response :success
  end

  test "should get new" do
    get new_familylink_url
    assert_response :success
  end

  test "should create familylink" do
    assert_difference('Familylink.count') do
      post familylinks_url, params: { familylink: { name_de: @familylink.name_de, name_en: @familylink.name_en, name_fr: @familylink.name_fr } }
    end

    assert_redirected_to familylink_url(Familylink.last)
  end

  test "should show familylink" do
    get familylink_url(@familylink)
    assert_response :success
  end

  test "should get edit" do
    get edit_familylink_url(@familylink)
    assert_response :success
  end

  test "should update familylink" do
    patch familylink_url(@familylink), params: { familylink: { name_de: @familylink.name_de, name_en: @familylink.name_en, name_fr: @familylink.name_fr } }
    assert_redirected_to familylink_url(@familylink)
  end

  test "should destroy familylink" do
    assert_difference('Familylink.count', -1) do
      delete familylink_url(@familylink)
    end

    assert_redirected_to familylinks_url
  end
end
