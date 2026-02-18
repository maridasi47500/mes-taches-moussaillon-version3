require 'test_helper'

class I18nphrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @i18nphrase = i18nphrases(:one)
  end

  test "should get index" do
    get i18nphrases_url
    assert_response :success
  end

  test "should get new" do
    get new_i18nphrase_url
    assert_response :success
  end

  test "should create i18nphrase" do
    assert_difference('I18nphrase.count') do
      post i18nphrases_url, params: { i18nphrase: { content_de: @i18nphrase.content_de, content_en: @i18nphrase.content_en, content_fr: @i18nphrase.content_fr } }
    end

    assert_redirected_to i18nphrase_url(I18nphrase.last)
  end

  test "should show i18nphrase" do
    get i18nphrase_url(@i18nphrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_i18nphrase_url(@i18nphrase)
    assert_response :success
  end

  test "should update i18nphrase" do
    patch i18nphrase_url(@i18nphrase), params: { i18nphrase: { content_de: @i18nphrase.content_de, content_en: @i18nphrase.content_en, content_fr: @i18nphrase.content_fr } }
    assert_redirected_to i18nphrase_url(@i18nphrase)
  end

  test "should destroy i18nphrase" do
    assert_difference('I18nphrase.count', -1) do
      delete i18nphrase_url(@i18nphrase)
    end

    assert_redirected_to i18nphrases_url
  end
end
