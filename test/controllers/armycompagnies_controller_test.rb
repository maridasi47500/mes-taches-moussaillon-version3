require 'test_helper'

class ArmycompagniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @armycompagny = armycompagnies(:one)
  end

  test "should get index" do
    get armycompagnies_url
    assert_response :success
  end

  test "should get new" do
    get new_armycompagny_url
    assert_response :success
  end

  test "should create armycompagny" do
    assert_difference('Armycompagny.count') do
      post armycompagnies_url, params: { armycompagny: { name: @armycompagny.name } }
    end

    assert_redirected_to armycompagny_url(Armycompagny.last)
  end

  test "should show armycompagny" do
    get armycompagny_url(@armycompagny)
    assert_response :success
  end

  test "should get edit" do
    get edit_armycompagny_url(@armycompagny)
    assert_response :success
  end

  test "should update armycompagny" do
    patch armycompagny_url(@armycompagny), params: { armycompagny: { name: @armycompagny.name } }
    assert_redirected_to armycompagny_url(@armycompagny)
  end

  test "should destroy armycompagny" do
    assert_difference('Armycompagny.count', -1) do
      delete armycompagny_url(@armycompagny)
    end

    assert_redirected_to armycompagnies_url
  end
end
