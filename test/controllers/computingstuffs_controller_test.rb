require 'test_helper'

class ComputingstuffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computingstuff = computingstuffs(:one)
  end

  test "should get index" do
    get computingstuffs_url
    assert_response :success
  end

  test "should get new" do
    get new_computingstuff_url
    assert_response :success
  end

  test "should create computingstuff" do
    assert_difference('Computingstuff.count') do
      post computingstuffs_url, params: { computingstuff: { image: @computingstuff.image, name: @computingstuff.name } }
    end

    assert_redirected_to computingstuff_url(Computingstuff.last)
  end

  test "should show computingstuff" do
    get computingstuff_url(@computingstuff)
    assert_response :success
  end

  test "should get edit" do
    get edit_computingstuff_url(@computingstuff)
    assert_response :success
  end

  test "should update computingstuff" do
    patch computingstuff_url(@computingstuff), params: { computingstuff: { image: @computingstuff.image, name: @computingstuff.name } }
    assert_redirected_to computingstuff_url(@computingstuff)
  end

  test "should destroy computingstuff" do
    assert_difference('Computingstuff.count', -1) do
      delete computingstuff_url(@computingstuff)
    end

    assert_redirected_to computingstuffs_url
  end
end
