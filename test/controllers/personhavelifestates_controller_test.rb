require 'test_helper'

class PersonhavelifestatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personhavelifestate = personhavelifestates(:one)
  end

  test "should get index" do
    get personhavelifestates_url
    assert_response :success
  end

  test "should get new" do
    get new_personhavelifestate_url
    assert_response :success
  end

  test "should create personhavelifestate" do
    assert_difference('Personhavelifestate.count') do
      post personhavelifestates_url, params: { personhavelifestate: {  } }
    end

    assert_redirected_to personhavelifestate_url(Personhavelifestate.last)
  end

  test "should show personhavelifestate" do
    get personhavelifestate_url(@personhavelifestate)
    assert_response :success
  end

  test "should get edit" do
    get edit_personhavelifestate_url(@personhavelifestate)
    assert_response :success
  end

  test "should update personhavelifestate" do
    patch personhavelifestate_url(@personhavelifestate), params: { personhavelifestate: {  } }
    assert_redirected_to personhavelifestate_url(@personhavelifestate)
  end

  test "should destroy personhavelifestate" do
    assert_difference('Personhavelifestate.count', -1) do
      delete personhavelifestate_url(@personhavelifestate)
    end

    assert_redirected_to personhavelifestates_url
  end
end
