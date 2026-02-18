require 'test_helper'

class ExchangebetweensailorandactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exchangebetweensailorandaction = exchangebetweensailorandactions(:one)
  end

  test "should get index" do
    get exchangebetweensailorandactions_url
    assert_response :success
  end

  test "should get new" do
    get new_exchangebetweensailorandaction_url
    assert_response :success
  end

  test "should create exchangebetweensailorandaction" do
    assert_difference('Exchangebetweensailorandaction.count') do
      post exchangebetweensailorandactions_url, params: { exchangebetweensailorandaction: { person_id: @exchangebetweensailorandaction.person_id, sailorandaction_id: @exchangebetweensailorandaction.sailorandaction_id } }
    end

    assert_redirected_to exchangebetweensailorandaction_url(Exchangebetweensailorandaction.last)
  end

  test "should show exchangebetweensailorandaction" do
    get exchangebetweensailorandaction_url(@exchangebetweensailorandaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_exchangebetweensailorandaction_url(@exchangebetweensailorandaction)
    assert_response :success
  end

  test "should update exchangebetweensailorandaction" do
    patch exchangebetweensailorandaction_url(@exchangebetweensailorandaction), params: { exchangebetweensailorandaction: { person_id: @exchangebetweensailorandaction.person_id, sailorandaction_id: @exchangebetweensailorandaction.sailorandaction_id } }
    assert_redirected_to exchangebetweensailorandaction_url(@exchangebetweensailorandaction)
  end

  test "should destroy exchangebetweensailorandaction" do
    assert_difference('Exchangebetweensailorandaction.count', -1) do
      delete exchangebetweensailorandaction_url(@exchangebetweensailorandaction)
    end

    assert_redirected_to exchangebetweensailorandactions_url
  end
end
