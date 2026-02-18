require 'test_helper'

class SpouselinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spouselink = spouselinks(:one)
  end

  test "should get index" do
    get spouselinks_url
    assert_response :success
  end

  test "should get new" do
    get new_spouselink_url
    assert_response :success
  end

  test "should create spouselink" do
    assert_difference('Spouselink.count') do
      post spouselinks_url, params: { spouselink: { name_de: @spouselink.name_de, name_en: @spouselink.name_en, name_fr: @spouselink.name_fr } }
    end

    assert_redirected_to spouselink_url(Spouselink.last)
  end

  test "should show spouselink" do
    get spouselink_url(@spouselink)
    assert_response :success
  end

  test "should get edit" do
    get edit_spouselink_url(@spouselink)
    assert_response :success
  end

  test "should update spouselink" do
    patch spouselink_url(@spouselink), params: { spouselink: { name_de: @spouselink.name_de, name_en: @spouselink.name_en, name_fr: @spouselink.name_fr } }
    assert_redirected_to spouselink_url(@spouselink)
  end

  test "should destroy spouselink" do
    assert_difference('Spouselink.count', -1) do
      delete spouselink_url(@spouselink)
    end

    assert_redirected_to spouselinks_url
  end
end
