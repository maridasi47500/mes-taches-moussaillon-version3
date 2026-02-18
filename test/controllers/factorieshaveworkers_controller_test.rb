require 'test_helper'

class FactorieshaveworkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factorieshaveworker = factorieshaveworkers(:one)
  end

  test "should get index" do
    get factorieshaveworkers_url
    assert_response :success
  end

  test "should get new" do
    get new_factorieshaveworker_url
    assert_response :success
  end

  test "should create factorieshaveworker" do
    assert_difference('Factorieshaveworker.count') do
      post factorieshaveworkers_url, params: { factorieshaveworker: {  } }
    end

    assert_redirected_to factorieshaveworker_url(Factorieshaveworker.last)
  end

  test "should show factorieshaveworker" do
    get factorieshaveworker_url(@factorieshaveworker)
    assert_response :success
  end

  test "should get edit" do
    get edit_factorieshaveworker_url(@factorieshaveworker)
    assert_response :success
  end

  test "should update factorieshaveworker" do
    patch factorieshaveworker_url(@factorieshaveworker), params: { factorieshaveworker: {  } }
    assert_redirected_to factorieshaveworker_url(@factorieshaveworker)
  end

  test "should destroy factorieshaveworker" do
    assert_difference('Factorieshaveworker.count', -1) do
      delete factorieshaveworker_url(@factorieshaveworker)
    end

    assert_redirected_to factorieshaveworkers_url
  end
end
