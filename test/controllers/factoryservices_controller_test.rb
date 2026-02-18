require 'test_helper'

class FactoryservicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factoryservice = factoryservices(:one)
  end

  test "should get index" do
    get factoryservices_url
    assert_response :success
  end

  test "should get new" do
    get new_factoryservice_url
    assert_response :success
  end

  test "should create factoryservice" do
    assert_difference('Factoryservice.count') do
      post factoryservices_url, params: { factoryservice: { image: @factoryservice.image, name: @factoryservice.name } }
    end

    assert_redirected_to factoryservice_url(Factoryservice.last)
  end

  test "should show factoryservice" do
    get factoryservice_url(@factoryservice)
    assert_response :success
  end

  test "should get edit" do
    get edit_factoryservice_url(@factoryservice)
    assert_response :success
  end

  test "should update factoryservice" do
    patch factoryservice_url(@factoryservice), params: { factoryservice: { image: @factoryservice.image, name: @factoryservice.name } }
    assert_redirected_to factoryservice_url(@factoryservice)
  end

  test "should destroy factoryservice" do
    assert_difference('Factoryservice.count', -1) do
      delete factoryservice_url(@factoryservice)
    end

    assert_redirected_to factoryservices_url
  end
end
