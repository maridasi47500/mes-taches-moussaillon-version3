require 'test_helper'

class MylayoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mylayout = mylayouts(:one)
  end

  test "should get index" do
    get mylayouts_url
    assert_response :success
  end

  test "should get new" do
    get new_mylayout_url
    assert_response :success
  end

  test "should create mylayout" do
    assert_difference('Mylayout.count') do
      post mylayouts_url, params: { mylayout: { name: @mylayout.name, title: @mylayout.title, typelayout: @mylayout.typelayout } }
    end

    assert_redirected_to mylayout_url(Mylayout.last)
  end

  test "should show mylayout" do
    get mylayout_url(@mylayout)
    assert_response :success
  end

  test "should get edit" do
    get edit_mylayout_url(@mylayout)
    assert_response :success
  end

  test "should update mylayout" do
    patch mylayout_url(@mylayout), params: { mylayout: { name: @mylayout.name, title: @mylayout.title, typelayout: @mylayout.typelayout } }
    assert_redirected_to mylayout_url(@mylayout)
  end

  test "should destroy mylayout" do
    assert_difference('Mylayout.count', -1) do
      delete mylayout_url(@mylayout)
    end

    assert_redirected_to mylayouts_url
  end
end
