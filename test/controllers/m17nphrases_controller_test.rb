require 'test_helper'

class M17nphrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @m17nphrase = m17nphrases(:one)
  end

  test "should get index" do
    get m17nphrases_url
    assert_response :success
  end

  test "should get new" do
    get new_m17nphrase_url
    assert_response :success
  end

  test "should create m17nphrase" do
    assert_difference('M17nphrase.count') do
      post m17nphrases_url, params: { m17nphrase: { content_de: @m17nphrase.content_de, content_en: @m17nphrase.content_en, content_fr: @m17nphrase.content_fr } }
    end

    assert_redirected_to m17nphrase_url(M17nphrase.last)
  end

  test "should show m17nphrase" do
    get m17nphrase_url(@m17nphrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_m17nphrase_url(@m17nphrase)
    assert_response :success
  end

  test "should update m17nphrase" do
    patch m17nphrase_url(@m17nphrase), params: { m17nphrase: { content_de: @m17nphrase.content_de, content_en: @m17nphrase.content_en, content_fr: @m17nphrase.content_fr } }
    assert_redirected_to m17nphrase_url(@m17nphrase)
  end

  test "should destroy m17nphrase" do
    assert_difference('M17nphrase.count', -1) do
      delete m17nphrase_url(@m17nphrase)
    end

    assert_redirected_to m17nphrases_url
  end
end
