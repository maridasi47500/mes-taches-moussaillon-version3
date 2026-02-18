require 'test_helper'

class HeroadventuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @heroadventure = heroadventures(:one)
  end

  test "should get index" do
    get heroadventures_url
    assert_response :success
  end

  test "should get new" do
    get new_heroadventure_url
    assert_response :success
  end

  test "should create heroadventure" do
    assert_difference('Heroadventure.count') do
      post heroadventures_url, params: { heroadventure: {  } }
    end

    assert_redirected_to heroadventure_url(Heroadventure.last)
  end

  test "should show heroadventure" do
    get heroadventure_url(@heroadventure)
    assert_response :success
  end

  test "should get edit" do
    get edit_heroadventure_url(@heroadventure)
    assert_response :success
  end

  test "should update heroadventure" do
    patch heroadventure_url(@heroadventure), params: { heroadventure: {  } }
    assert_redirected_to heroadventure_url(@heroadventure)
  end

  test "should destroy heroadventure" do
    assert_difference('Heroadventure.count', -1) do
      delete heroadventure_url(@heroadventure)
    end

    assert_redirected_to heroadventures_url
  end
end
