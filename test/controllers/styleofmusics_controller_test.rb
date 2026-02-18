require 'test_helper'

class StyleofmusicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @styleofmusic = styleofmusics(:one)
  end

  test "should get index" do
    get styleofmusics_url
    assert_response :success
  end

  test "should get new" do
    get new_styleofmusic_url
    assert_response :success
  end

  test "should create styleofmusic" do
    assert_difference('Styleofmusic.count') do
      post styleofmusics_url, params: { styleofmusic: {  } }
    end

    assert_redirected_to styleofmusic_url(Styleofmusic.last)
  end

  test "should show styleofmusic" do
    get styleofmusic_url(@styleofmusic)
    assert_response :success
  end

  test "should get edit" do
    get edit_styleofmusic_url(@styleofmusic)
    assert_response :success
  end

  test "should update styleofmusic" do
    patch styleofmusic_url(@styleofmusic), params: { styleofmusic: {  } }
    assert_redirected_to styleofmusic_url(@styleofmusic)
  end

  test "should destroy styleofmusic" do
    assert_difference('Styleofmusic.count', -1) do
      delete styleofmusic_url(@styleofmusic)
    end

    assert_redirected_to styleofmusics_url
  end
end
