require 'test_helper'

class ArmygradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @armygrade = armygrades(:one)
  end

  test "should get index" do
    get armygrades_url
    assert_response :success
  end

  test "should get new" do
    get new_armygrade_url
    assert_response :success
  end

  test "should create armygrade" do
    assert_difference('Armygrade.count') do
      post armygrades_url, params: { armygrade: { appellation: @armygrade.appellation, image: @armygrade.image, nom: @armygrade.nom } }
    end

    assert_redirected_to armygrade_url(Armygrade.last)
  end

  test "should show armygrade" do
    get armygrade_url(@armygrade)
    assert_response :success
  end

  test "should get edit" do
    get edit_armygrade_url(@armygrade)
    assert_response :success
  end

  test "should update armygrade" do
    patch armygrade_url(@armygrade), params: { armygrade: { appellation: @armygrade.appellation, image: @armygrade.image, nom: @armygrade.nom } }
    assert_redirected_to armygrade_url(@armygrade)
  end

  test "should destroy armygrade" do
    assert_difference('Armygrade.count', -1) do
      delete armygrade_url(@armygrade)
    end

    assert_redirected_to armygrades_url
  end
end
