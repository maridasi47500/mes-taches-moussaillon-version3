require 'test_helper'

class UstensilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ustensile = ustensiles(:one)
  end

  test "should get index" do
    get ustensiles_url
    assert_response :success
  end

  test "should get new" do
    get new_ustensile_url
    assert_response :success
  end

  test "should create ustensile" do
    assert_difference('Ustensile.count') do
      post ustensiles_url, params: { ustensile: { image: @ustensile.image, name: @ustensile.name } }
    end

    assert_redirected_to ustensile_url(Ustensile.last)
  end

  test "should show ustensile" do
    get ustensile_url(@ustensile)
    assert_response :success
  end

  test "should get edit" do
    get edit_ustensile_url(@ustensile)
    assert_response :success
  end

  test "should update ustensile" do
    patch ustensile_url(@ustensile), params: { ustensile: { image: @ustensile.image, name: @ustensile.name } }
    assert_redirected_to ustensile_url(@ustensile)
  end

  test "should destroy ustensile" do
    assert_difference('Ustensile.count', -1) do
      delete ustensile_url(@ustensile)
    end

    assert_redirected_to ustensiles_url
  end
end
