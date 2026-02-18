require 'test_helper'

class RepasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repas = repas(:one)
  end

  test "should get index" do
    get repas_index_url
    assert_response :success
  end

  test "should get new" do
    get new_repas_url
    assert_response :success
  end

  test "should create repas" do
    assert_difference('Repas.count') do
      post repas_index_url, params: { repas: { date: @repas.date, somme: @repas.somme, username: @repas.username } }
    end

    assert_redirected_to repas_url(Repas.last)
  end

  test "should show repas" do
    get repas_url(@repas)
    assert_response :success
  end

  test "should get edit" do
    get edit_repas_url(@repas)
    assert_response :success
  end

  test "should update repas" do
    patch repas_url(@repas), params: { repas: { date: @repas.date, somme: @repas.somme, username: @repas.username } }
    assert_redirected_to repas_url(@repas)
  end

  test "should destroy repas" do
    assert_difference('Repas.count', -1) do
      delete repas_url(@repas)
    end

    assert_redirected_to repas_index_url
  end
end
