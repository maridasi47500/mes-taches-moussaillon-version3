require 'test_helper'

class PersonstatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personstate = personstates(:one)
  end

  test "should get index" do
    get personstates_url
    assert_response :success
  end

  test "should get new" do
    get new_personstate_url
    assert_response :success
  end

  test "should create personstate" do
    assert_difference('Personstate.count') do
      post personstates_url, params: { personstate: { state_de: @personstate.state_de, state_en: @personstate.state_en, state_fr: @personstate.state_fr } }
    end

    assert_redirected_to personstate_url(Personstate.last)
  end

  test "should show personstate" do
    get personstate_url(@personstate)
    assert_response :success
  end

  test "should get edit" do
    get edit_personstate_url(@personstate)
    assert_response :success
  end

  test "should update personstate" do
    patch personstate_url(@personstate), params: { personstate: { state_de: @personstate.state_de, state_en: @personstate.state_en, state_fr: @personstate.state_fr } }
    assert_redirected_to personstate_url(@personstate)
  end

  test "should destroy personstate" do
    assert_difference('Personstate.count', -1) do
      delete personstate_url(@personstate)
    end

    assert_redirected_to personstates_url
  end
end
