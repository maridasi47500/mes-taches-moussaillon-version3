require 'test_helper'

class MusicalkeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @musicalkey = musicalkeys(:one)
  end

  test "should get index" do
    get musicalkeys_url
    assert_response :success
  end

  test "should get new" do
    get new_musicalkey_url
    assert_response :success
  end

  test "should create musicalkey" do
    assert_difference('Musicalkey.count') do
      post musicalkeys_url, params: { musicalkey: { name_de: @musicalkey.name_de, name_en: @musicalkey.name_en, name_fr: @musicalkey.name_fr } }
    end

    assert_redirected_to musicalkey_url(Musicalkey.last)
  end

  test "should show musicalkey" do
    get musicalkey_url(@musicalkey)
    assert_response :success
  end

  test "should get edit" do
    get edit_musicalkey_url(@musicalkey)
    assert_response :success
  end

  test "should update musicalkey" do
    patch musicalkey_url(@musicalkey), params: { musicalkey: { name_de: @musicalkey.name_de, name_en: @musicalkey.name_en, name_fr: @musicalkey.name_fr } }
    assert_redirected_to musicalkey_url(@musicalkey)
  end

  test "should destroy musicalkey" do
    assert_difference('Musicalkey.count', -1) do
      delete musicalkey_url(@musicalkey)
    end

    assert_redirected_to musicalkeys_url
  end
end
