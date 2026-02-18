require 'test_helper'

class RealfactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @realfact = realfacts(:one)
  end

  test "should get index" do
    get realfacts_url
    assert_response :success
  end

  test "should get new" do
    get new_realfact_url
    assert_response :success
  end

  test "should create realfact" do
    assert_difference('Realfact.count') do
      post realfacts_url, params: { realfact: { content_de: @realfact.content_de, content_en: @realfact.content_en, content_fr: @realfact.content_fr } }
    end

    assert_redirected_to realfact_url(Realfact.last)
  end

  test "should show realfact" do
    get realfact_url(@realfact)
    assert_response :success
  end

  test "should get edit" do
    get edit_realfact_url(@realfact)
    assert_response :success
  end

  test "should update realfact" do
    patch realfact_url(@realfact), params: { realfact: { content_de: @realfact.content_de, content_en: @realfact.content_en, content_fr: @realfact.content_fr } }
    assert_redirected_to realfact_url(@realfact)
  end

  test "should destroy realfact" do
    assert_difference('Realfact.count', -1) do
      delete realfact_url(@realfact)
    end

    assert_redirected_to realfacts_url
  end
end
