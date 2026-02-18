require 'test_helper'

class SecretoccupationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @secretoccupation = secretoccupations(:one)
  end

  test "should get index" do
    get secretoccupations_url
    assert_response :success
  end

  test "should get new" do
    get new_secretoccupation_url
    assert_response :success
  end

  test "should create secretoccupation" do
    assert_difference('Secretoccupation.count') do
      post secretoccupations_url, params: { secretoccupation: { content_de: @secretoccupation.content_de, content_en: @secretoccupation.content_en, content_fr: @secretoccupation.content_fr } }
    end

    assert_redirected_to secretoccupation_url(Secretoccupation.last)
  end

  test "should show secretoccupation" do
    get secretoccupation_url(@secretoccupation)
    assert_response :success
  end

  test "should get edit" do
    get edit_secretoccupation_url(@secretoccupation)
    assert_response :success
  end

  test "should update secretoccupation" do
    patch secretoccupation_url(@secretoccupation), params: { secretoccupation: { content_de: @secretoccupation.content_de, content_en: @secretoccupation.content_en, content_fr: @secretoccupation.content_fr } }
    assert_redirected_to secretoccupation_url(@secretoccupation)
  end

  test "should destroy secretoccupation" do
    assert_difference('Secretoccupation.count', -1) do
      delete secretoccupation_url(@secretoccupation)
    end

    assert_redirected_to secretoccupations_url
  end
end
