require 'test_helper'

class CitymayorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @citymayor = citymayors(:one)
  end

  test "should get index" do
    get citymayors_url
    assert_response :success
  end

  test "should get new" do
    get new_citymayor_url
    assert_response :success
  end

  test "should create citymayor" do
    assert_difference('Citymayor.count') do
      post citymayors_url, params: { citymayor: {  } }
    end

    assert_redirected_to citymayor_url(Citymayor.last)
  end

  test "should show citymayor" do
    get citymayor_url(@citymayor)
    assert_response :success
  end

  test "should get edit" do
    get edit_citymayor_url(@citymayor)
    assert_response :success
  end

  test "should update citymayor" do
    patch citymayor_url(@citymayor), params: { citymayor: {  } }
    assert_redirected_to citymayor_url(@citymayor)
  end

  test "should destroy citymayor" do
    assert_difference('Citymayor.count', -1) do
      delete citymayor_url(@citymayor)
    end

    assert_redirected_to citymayors_url
  end
end
