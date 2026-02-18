require 'test_helper'

class SocialmovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @socialmovement = socialmovements(:one)
  end

  test "should get index" do
    get socialmovements_url
    assert_response :success
  end

  test "should get new" do
    get new_socialmovement_url
    assert_response :success
  end

  test "should create socialmovement" do
    assert_difference('Socialmovement.count') do
      post socialmovements_url, params: { socialmovement: { image: @socialmovement.image, name: @socialmovement.name } }
    end

    assert_redirected_to socialmovement_url(Socialmovement.last)
  end

  test "should show socialmovement" do
    get socialmovement_url(@socialmovement)
    assert_response :success
  end

  test "should get edit" do
    get edit_socialmovement_url(@socialmovement)
    assert_response :success
  end

  test "should update socialmovement" do
    patch socialmovement_url(@socialmovement), params: { socialmovement: { image: @socialmovement.image, name: @socialmovement.name } }
    assert_redirected_to socialmovement_url(@socialmovement)
  end

  test "should destroy socialmovement" do
    assert_difference('Socialmovement.count', -1) do
      delete socialmovement_url(@socialmovement)
    end

    assert_redirected_to socialmovements_url
  end
end
