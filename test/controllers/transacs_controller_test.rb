require 'test_helper'

class TransacsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transac = transacs(:one)
  end

  test "should get index" do
    get transacs_url
    assert_response :success
  end

  test "should get new" do
    get new_transac_url
    assert_response :success
  end

  test "should create transac" do
    assert_difference('Transac.count') do
      post transacs_url, params: { transac: { date: @transac.date, motif: @transac.motif, somme: @transac.somme, username: @transac.username } }
    end

    assert_redirected_to transac_url(Transac.last)
  end

  test "should show transac" do
    get transac_url(@transac)
    assert_response :success
  end

  test "should get edit" do
    get edit_transac_url(@transac)
    assert_response :success
  end

  test "should update transac" do
    patch transac_url(@transac), params: { transac: { date: @transac.date, motif: @transac.motif, somme: @transac.somme, username: @transac.username } }
    assert_redirected_to transac_url(@transac)
  end

  test "should destroy transac" do
    assert_difference('Transac.count', -1) do
      delete transac_url(@transac)
    end

    assert_redirected_to transacs_url
  end
end
