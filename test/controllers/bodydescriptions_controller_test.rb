require 'test_helper'

class BodydescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bodydescription = bodydescriptions(:one)
  end

  test "should get index" do
    get bodydescriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_bodydescription_url
    assert_response :success
  end

  test "should create bodydescription" do
    assert_difference('Bodydescription.count') do
      post bodydescriptions_url, params: { bodydescription: { name: @bodydescription.name } }
    end

    assert_redirected_to bodydescription_url(Bodydescription.last)
  end

  test "should show bodydescription" do
    get bodydescription_url(@bodydescription)
    assert_response :success
  end

  test "should get edit" do
    get edit_bodydescription_url(@bodydescription)
    assert_response :success
  end

  test "should update bodydescription" do
    patch bodydescription_url(@bodydescription), params: { bodydescription: { name: @bodydescription.name } }
    assert_redirected_to bodydescription_url(@bodydescription)
  end

  test "should destroy bodydescription" do
    assert_difference('Bodydescription.count', -1) do
      delete bodydescription_url(@bodydescription)
    end

    assert_redirected_to bodydescriptions_url
  end
end
