require 'test_helper'

class BacseriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bacseries = bacseries(:one)
  end

  test "should get index" do
    get bacseries_url
    assert_response :success
  end

  test "should get new" do
    get new_bacseries_url
    assert_response :success
  end

  test "should create bacseries" do
    assert_difference('Bacserie.count') do
      post bacseries_url, params: { bacseries: { name: @bacseries.name } }
    end

    assert_redirected_to bacseries_url(Bacserie.last)
  end

  test "should show bacseries" do
    get bacseries_url(@bacseries)
    assert_response :success
  end

  test "should get edit" do
    get edit_bacseries_url(@bacseries)
    assert_response :success
  end

  test "should update bacseries" do
    patch bacseries_url(@bacseries), params: { bacseries: { name: @bacseries.name } }
    assert_redirected_to bacseries_url(@bacseries)
  end

  test "should destroy bacseries" do
    assert_difference('Bacserie.count', -1) do
      delete bacseries_url(@bacseries)
    end

    assert_redirected_to bacseries_url
  end
end
