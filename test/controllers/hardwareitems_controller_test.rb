require 'test_helper'

class HardwareitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hardwareitem = hardwareitems(:one)
  end

  test "should get index" do
    get hardwareitems_url
    assert_response :success
  end

  test "should get new" do
    get new_hardwareitem_url
    assert_response :success
  end

  test "should create hardwareitem" do
    assert_difference('Hardwareitem.count') do
      post hardwareitems_url, params: { hardwareitem: { image: @hardwareitem.image, name: @hardwareitem.name } }
    end

    assert_redirected_to hardwareitem_url(Hardwareitem.last)
  end

  test "should show hardwareitem" do
    get hardwareitem_url(@hardwareitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_hardwareitem_url(@hardwareitem)
    assert_response :success
  end

  test "should update hardwareitem" do
    patch hardwareitem_url(@hardwareitem), params: { hardwareitem: { image: @hardwareitem.image, name: @hardwareitem.name } }
    assert_redirected_to hardwareitem_url(@hardwareitem)
  end

  test "should destroy hardwareitem" do
    assert_difference('Hardwareitem.count', -1) do
      delete hardwareitem_url(@hardwareitem)
    end

    assert_redirected_to hardwareitems_url
  end
end
