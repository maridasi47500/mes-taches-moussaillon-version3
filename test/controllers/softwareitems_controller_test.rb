require 'test_helper'

class SoftwareitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @softwareitem = softwareitems(:one)
  end

  test "should get index" do
    get softwareitems_url
    assert_response :success
  end

  test "should get new" do
    get new_softwareitem_url
    assert_response :success
  end

  test "should create softwareitem" do
    assert_difference('Softwareitem.count') do
      post softwareitems_url, params: { softwareitem: { image: @softwareitem.image, name: @softwareitem.name } }
    end

    assert_redirected_to softwareitem_url(Softwareitem.last)
  end

  test "should show softwareitem" do
    get softwareitem_url(@softwareitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_softwareitem_url(@softwareitem)
    assert_response :success
  end

  test "should update softwareitem" do
    patch softwareitem_url(@softwareitem), params: { softwareitem: { image: @softwareitem.image, name: @softwareitem.name } }
    assert_redirected_to softwareitem_url(@softwareitem)
  end

  test "should destroy softwareitem" do
    assert_difference('Softwareitem.count', -1) do
      delete softwareitem_url(@softwareitem)
    end

    assert_redirected_to softwareitems_url
  end
end
