require 'test_helper'

class HairlengthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hairlength = hairlengths(:one)
  end

  test "should get index" do
    get hairlengths_url
    assert_response :success
  end

  test "should get new" do
    get new_hairlength_url
    assert_response :success
  end

  test "should create hairlength" do
    assert_difference('Hairlength.count') do
      post hairlengths_url, params: { hairlength: { name: @hairlength.name } }
    end

    assert_redirected_to hairlength_url(Hairlength.last)
  end

  test "should show hairlength" do
    get hairlength_url(@hairlength)
    assert_response :success
  end

  test "should get edit" do
    get edit_hairlength_url(@hairlength)
    assert_response :success
  end

  test "should update hairlength" do
    patch hairlength_url(@hairlength), params: { hairlength: { name: @hairlength.name } }
    assert_redirected_to hairlength_url(@hairlength)
  end

  test "should destroy hairlength" do
    assert_difference('Hairlength.count', -1) do
      delete hairlength_url(@hairlength)
    end

    assert_redirected_to hairlengths_url
  end
end
