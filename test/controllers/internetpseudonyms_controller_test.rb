require 'test_helper'

class InternetpseudonymsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internetpseudonym = internetpseudonyms(:one)
  end

  test "should get index" do
    get internetpseudonyms_url
    assert_response :success
  end

  test "should get new" do
    get new_internetpseudonym_url
    assert_response :success
  end

  test "should create internetpseudonym" do
    assert_difference('Internetpseudonym.count') do
      post internetpseudonyms_url, params: { internetpseudonym: {  } }
    end

    assert_redirected_to internetpseudonym_url(Internetpseudonym.last)
  end

  test "should show internetpseudonym" do
    get internetpseudonym_url(@internetpseudonym)
    assert_response :success
  end

  test "should get edit" do
    get edit_internetpseudonym_url(@internetpseudonym)
    assert_response :success
  end

  test "should update internetpseudonym" do
    patch internetpseudonym_url(@internetpseudonym), params: { internetpseudonym: {  } }
    assert_redirected_to internetpseudonym_url(@internetpseudonym)
  end

  test "should destroy internetpseudonym" do
    assert_difference('Internetpseudonym.count', -1) do
      delete internetpseudonym_url(@internetpseudonym)
    end

    assert_redirected_to internetpseudonyms_url
  end
end
