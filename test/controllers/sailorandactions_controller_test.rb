require 'test_helper'

class SailorandactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sailorandaction = sailorandactions(:one)
  end

  test "should get index" do
    get sailorandactions_url
    assert_response :success
  end

  test "should get new" do
    get new_sailorandaction_url
    assert_response :success
  end

  test "should create sailorandaction" do
    assert_difference('Sailorandaction.count') do
      post sailorandactions_url, params: { sailorandaction: {  } }
    end

    assert_redirected_to sailorandaction_url(Sailorandaction.last)
  end

  test "should show sailorandaction" do
    get sailorandaction_url(@sailorandaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_sailorandaction_url(@sailorandaction)
    assert_response :success
  end

  test "should update sailorandaction" do
    patch sailorandaction_url(@sailorandaction), params: { sailorandaction: {  } }
    assert_redirected_to sailorandaction_url(@sailorandaction)
  end

  test "should destroy sailorandaction" do
    assert_difference('Sailorandaction.count', -1) do
      delete sailorandaction_url(@sailorandaction)
    end

    assert_redirected_to sailorandactions_url
  end
end
