require 'test_helper'

class ClesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cle = cles(:one)
  end

  test "should get index" do
    get cles_url
    assert_response :success
  end

  test "should get new" do
    get new_cle_url
    assert_response :success
  end

  test "should create cle" do
    assert_difference('Cle.count') do
      post cles_url, params: { cle: { armygrade_id: @cle.armygrade_id, date: @cle.date, observation: @cle.observation, perception: @cle.perception, person_id: @cle.person_id, reintegration: @cle.reintegration } }
    end

    assert_redirected_to cle_url(Cle.last)
  end

  test "should show cle" do
    get cle_url(@cle)
    assert_response :success
  end

  test "should get edit" do
    get edit_cle_url(@cle)
    assert_response :success
  end

  test "should update cle" do
    patch cle_url(@cle), params: { cle: { armygrade_id: @cle.armygrade_id, date: @cle.date, observation: @cle.observation, perception: @cle.perception, person_id: @cle.person_id, reintegration: @cle.reintegration } }
    assert_redirected_to cle_url(@cle)
  end

  test "should destroy cle" do
    assert_difference('Cle.count', -1) do
      delete cle_url(@cle)
    end

    assert_redirected_to cles_url
  end
end
