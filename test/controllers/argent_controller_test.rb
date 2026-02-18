require 'test_helper'

class ArgentControllerTest < ActionDispatch::IntegrationTest
  setup do
    @argent = argent(:one)
  end

  test "should get index" do
    get argent_index_url
    assert_response :success
  end

  test "should get new" do
    get new_argent_url
    assert_response :success
  end

  test "should create argent" do
    assert_difference('Argent.count') do
      post argent_index_url, params: { argent: { annee: @argent.annee, apayer: @argent.apayer, mois: @argent.mois, paye: @argent.paye, username: @argent.username } }
    end

    assert_redirected_to argent_url(Argent.last)
  end

  test "should show argent" do
    get argent_url(@argent)
    assert_response :success
  end

  test "should get edit" do
    get edit_argent_url(@argent)
    assert_response :success
  end

  test "should update argent" do
    patch argent_url(@argent), params: { argent: { annee: @argent.annee, apayer: @argent.apayer, mois: @argent.mois, paye: @argent.paye, username: @argent.username } }
    assert_redirected_to argent_url(@argent)
  end

  test "should destroy argent" do
    assert_difference('Argent.count', -1) do
      delete argent_url(@argent)
    end

    assert_redirected_to argent_index_url
  end
end
