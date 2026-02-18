require 'test_helper'

class LifestatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lifestate = lifestates(:one)
  end

  test "should get index" do
    get lifestates_url
    assert_response :success
  end

  test "should get new" do
    get new_lifestate_url
    assert_response :success
  end

  test "should create lifestate" do
    assert_difference('Lifestate.count') do
      post lifestates_url, params: { lifestate: { name_de: @lifestate.name_de, name_en: @lifestate.name_en, name_fr: @lifestate.name_fr } }
    end

    assert_redirected_to lifestate_url(Lifestate.last)
  end

  test "should show lifestate" do
    get lifestate_url(@lifestate)
    assert_response :success
  end

  test "should get edit" do
    get edit_lifestate_url(@lifestate)
    assert_response :success
  end

  test "should update lifestate" do
    patch lifestate_url(@lifestate), params: { lifestate: { name_de: @lifestate.name_de, name_en: @lifestate.name_en, name_fr: @lifestate.name_fr } }
    assert_redirected_to lifestate_url(@lifestate)
  end

  test "should destroy lifestate" do
    assert_difference('Lifestate.count', -1) do
      delete lifestate_url(@lifestate)
    end

    assert_redirected_to lifestates_url
  end
end
