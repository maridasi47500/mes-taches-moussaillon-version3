require 'test_helper'

class EtnicitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @etnicity = etnicities(:one)
  end

  test "should get index" do
    get etnicities_url
    assert_response :success
  end

  test "should get new" do
    get new_etnicity_url
    assert_response :success
  end

  test "should create etnicity" do
    assert_difference('Etnicity.count') do
      post etnicities_url, params: { etnicity: { image: @etnicity.image, name: @etnicity.name } }
    end

    assert_redirected_to etnicity_url(Etnicity.last)
  end

  test "should show etnicity" do
    get etnicity_url(@etnicity)
    assert_response :success
  end

  test "should get edit" do
    get edit_etnicity_url(@etnicity)
    assert_response :success
  end

  test "should update etnicity" do
    patch etnicity_url(@etnicity), params: { etnicity: { image: @etnicity.image, name: @etnicity.name } }
    assert_redirected_to etnicity_url(@etnicity)
  end

  test "should destroy etnicity" do
    assert_difference('Etnicity.count', -1) do
      delete etnicity_url(@etnicity)
    end

    assert_redirected_to etnicities_url
  end
end
