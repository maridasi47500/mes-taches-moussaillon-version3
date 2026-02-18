require 'test_helper'

class NavettesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @navette = navettes(:one)
  end

  test "should get index" do
    get navettes_url
    assert_response :success
  end

  test "should get new" do
    get new_navette_url
    assert_response :success
  end

  test "should create navette" do
    assert_difference('Navette.count') do
      post navettes_url, params: { navette: { back: @navette.back, citya_id: @navette.citya_id, cityb_id: @navette.cityb_id, compagnie_id: @navette.compagnie_id, go: @navette.go } }
    end

    assert_redirected_to navette_url(Navette.last)
  end

  test "should show navette" do
    get navette_url(@navette)
    assert_response :success
  end

  test "should get edit" do
    get edit_navette_url(@navette)
    assert_response :success
  end

  test "should update navette" do
    patch navette_url(@navette), params: { navette: { back: @navette.back, citya_id: @navette.citya_id, cityb_id: @navette.cityb_id, compagnie_id: @navette.compagnie_id, go: @navette.go } }
    assert_redirected_to navette_url(@navette)
  end

  test "should destroy navette" do
    assert_difference('Navette.count', -1) do
      delete navette_url(@navette)
    end

    assert_redirected_to navettes_url
  end
end
