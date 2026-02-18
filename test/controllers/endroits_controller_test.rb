require 'test_helper'

class EndroitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @endroit = endroits(:one)
  end

  test "should get index" do
    get endroits_url
    assert_response :success
  end

  test "should get new" do
    get new_endroit_url
    assert_response :success
  end

  test "should create endroit" do
    assert_difference('Endroit.count') do
      post endroits_url, params: { endroit: { image: @endroit.image, name: @endroit.name } }
    end

    assert_redirected_to endroit_url(Endroit.last)
  end

  test "should show endroit" do
    get endroit_url(@endroit)
    assert_response :success
  end

  test "should get edit" do
    get edit_endroit_url(@endroit)
    assert_response :success
  end

  test "should update endroit" do
    patch endroit_url(@endroit), params: { endroit: { image: @endroit.image, name: @endroit.name } }
    assert_redirected_to endroit_url(@endroit)
  end

  test "should destroy endroit" do
    assert_difference('Endroit.count', -1) do
      delete endroit_url(@endroit)
    end

    assert_redirected_to endroits_url
  end
end
