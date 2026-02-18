require 'test_helper'

class PridesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pride = prides(:one)
  end

  test "should get index" do
    get prides_url
    assert_response :success
  end

  test "should get new" do
    get new_pride_url
    assert_response :success
  end

  test "should create pride" do
    assert_difference('Pride.count') do
      post prides_url, params: { pride: { content_de: @pride.content_de, content_en: @pride.content_en, content_fr: @pride.content_fr } }
    end

    assert_redirected_to pride_url(Pride.last)
  end

  test "should show pride" do
    get pride_url(@pride)
    assert_response :success
  end

  test "should get edit" do
    get edit_pride_url(@pride)
    assert_response :success
  end

  test "should update pride" do
    patch pride_url(@pride), params: { pride: { content_de: @pride.content_de, content_en: @pride.content_en, content_fr: @pride.content_fr } }
    assert_redirected_to pride_url(@pride)
  end

  test "should destroy pride" do
    assert_difference('Pride.count', -1) do
      delete pride_url(@pride)
    end

    assert_redirected_to prides_url
  end
end
