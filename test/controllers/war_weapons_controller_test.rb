require 'test_helper'

class WarWeaponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @war_weapon = war_weapons(:one)
  end

  test "should get index" do
    get war_weapons_url
    assert_response :success
  end

  test "should get new" do
    get new_war_weapon_url
    assert_response :success
  end

  test "should create war_weapon" do
    assert_difference('WarWeapon.count') do
      post war_weapons_url, params: { war_weapon: { image: @war_weapon.image, name: @war_weapon.name } }
    end

    assert_redirected_to war_weapon_url(WarWeapon.last)
  end

  test "should show war_weapon" do
    get war_weapon_url(@war_weapon)
    assert_response :success
  end

  test "should get edit" do
    get edit_war_weapon_url(@war_weapon)
    assert_response :success
  end

  test "should update war_weapon" do
    patch war_weapon_url(@war_weapon), params: { war_weapon: { image: @war_weapon.image, name: @war_weapon.name } }
    assert_redirected_to war_weapon_url(@war_weapon)
  end

  test "should destroy war_weapon" do
    assert_difference('WarWeapon.count', -1) do
      delete war_weapon_url(@war_weapon)
    end

    assert_redirected_to war_weapons_url
  end
end
