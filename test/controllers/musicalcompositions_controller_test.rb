require 'test_helper'

class MusicalcompositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @musicalcomposition = musicalcompositions(:one)
  end

  test "should get index" do
    get musicalcompositions_url
    assert_response :success
  end

  test "should get new" do
    get new_musicalcomposition_url
    assert_response :success
  end

  test "should create musicalcomposition" do
    assert_difference('Musicalcomposition.count') do
      post musicalcompositions_url, params: { musicalcomposition: { title: @musicalcomposition.title } }
    end

    assert_redirected_to musicalcomposition_url(Musicalcomposition.last)
  end

  test "should show musicalcomposition" do
    get musicalcomposition_url(@musicalcomposition)
    assert_response :success
  end

  test "should get edit" do
    get edit_musicalcomposition_url(@musicalcomposition)
    assert_response :success
  end

  test "should update musicalcomposition" do
    patch musicalcomposition_url(@musicalcomposition), params: { musicalcomposition: { title: @musicalcomposition.title } }
    assert_redirected_to musicalcomposition_url(@musicalcomposition)
  end

  test "should destroy musicalcomposition" do
    assert_difference('Musicalcomposition.count', -1) do
      delete musicalcomposition_url(@musicalcomposition)
    end

    assert_redirected_to musicalcompositions_url
  end
end
