require 'test_helper'

class FaceshapesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @faceshape = faceshapes(:one)
  end

  test "should get index" do
    get faceshapes_url
    assert_response :success
  end

  test "should get new" do
    get new_faceshape_url
    assert_response :success
  end

  test "should create faceshape" do
    assert_difference('Faceshape.count') do
      post faceshapes_url, params: { faceshape: { name: @faceshape.name } }
    end

    assert_redirected_to faceshape_url(Faceshape.last)
  end

  test "should show faceshape" do
    get faceshape_url(@faceshape)
    assert_response :success
  end

  test "should get edit" do
    get edit_faceshape_url(@faceshape)
    assert_response :success
  end

  test "should update faceshape" do
    patch faceshape_url(@faceshape), params: { faceshape: { name: @faceshape.name } }
    assert_redirected_to faceshape_url(@faceshape)
  end

  test "should destroy faceshape" do
    assert_difference('Faceshape.count', -1) do
      delete faceshape_url(@faceshape)
    end

    assert_redirected_to faceshapes_url
  end
end
