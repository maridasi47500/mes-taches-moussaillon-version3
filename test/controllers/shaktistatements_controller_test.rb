require 'test_helper'

class ShaktistatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shaktistatement = shaktistatements(:one)
  end

  test "should get index" do
    get shaktistatements_url
    assert_response :success
  end

  test "should get new" do
    get new_shaktistatement_url
    assert_response :success
  end

  test "should create shaktistatement" do
    assert_difference('Shaktistatement.count') do
      post shaktistatements_url, params: { shaktistatement: { content_de: @shaktistatement.content_de, content_en: @shaktistatement.content_en, content_fr: @shaktistatement.content_fr } }
    end

    assert_redirected_to shaktistatement_url(Shaktistatement.last)
  end

  test "should show shaktistatement" do
    get shaktistatement_url(@shaktistatement)
    assert_response :success
  end

  test "should get edit" do
    get edit_shaktistatement_url(@shaktistatement)
    assert_response :success
  end

  test "should update shaktistatement" do
    patch shaktistatement_url(@shaktistatement), params: { shaktistatement: { content_de: @shaktistatement.content_de, content_en: @shaktistatement.content_en, content_fr: @shaktistatement.content_fr } }
    assert_redirected_to shaktistatement_url(@shaktistatement)
  end

  test "should destroy shaktistatement" do
    assert_difference('Shaktistatement.count', -1) do
      delete shaktistatement_url(@shaktistatement)
    end

    assert_redirected_to shaktistatements_url
  end
end
