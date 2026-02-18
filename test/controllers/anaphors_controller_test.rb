require 'test_helper'

class AnaphorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anaphor = anaphors(:one)
  end

  test "should get index" do
    get anaphors_url
    assert_response :success
  end

  test "should get new" do
    get new_anaphor_url
    assert_response :success
  end

  test "should create anaphor" do
    assert_difference('Anaphor.count') do
      post anaphors_url, params: { anaphor: {  } }
    end

    assert_redirected_to anaphor_url(Anaphor.last)
  end

  test "should show anaphor" do
    get anaphor_url(@anaphor)
    assert_response :success
  end

  test "should get edit" do
    get edit_anaphor_url(@anaphor)
    assert_response :success
  end

  test "should update anaphor" do
    patch anaphor_url(@anaphor), params: { anaphor: {  } }
    assert_redirected_to anaphor_url(@anaphor)
  end

  test "should destroy anaphor" do
    assert_difference('Anaphor.count', -1) do
      delete anaphor_url(@anaphor)
    end

    assert_redirected_to anaphors_url
  end
end
