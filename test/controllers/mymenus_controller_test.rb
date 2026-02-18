require 'test_helper'

class MymenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mymenu = mymenus(:one)
  end

  test "should get index" do
    get mymenus_url
    assert_response :success
  end

  test "should get new" do
    get new_mymenu_url
    assert_response :success
  end

  test "should create mymenu" do
    assert_difference('Mymenu.count') do
      post mymenus_url, params: { mymenu: {  } }
    end

    assert_redirected_to mymenu_url(Mymenu.last)
  end

  test "should show mymenu" do
    get mymenu_url(@mymenu)
    assert_response :success
  end

  test "should get edit" do
    get edit_mymenu_url(@mymenu)
    assert_response :success
  end

  test "should update mymenu" do
    patch mymenu_url(@mymenu), params: { mymenu: {  } }
    assert_redirected_to mymenu_url(@mymenu)
  end

  test "should destroy mymenu" do
    assert_difference('Mymenu.count', -1) do
      delete mymenu_url(@mymenu)
    end

    assert_redirected_to mymenus_url
  end
end
