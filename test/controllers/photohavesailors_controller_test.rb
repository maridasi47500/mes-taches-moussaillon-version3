require 'test_helper'

class PhotohavesailorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photohavesailor = photohavesailors(:one)
  end

  test "should get index" do
    get photohavesailors_url
    assert_response :success
  end

  test "should get new" do
    get new_photohavesailor_url
    assert_response :success
  end

  test "should create photohavesailor" do
    assert_difference('Photohavesailor.count') do
      post photohavesailors_url, params: { photohavesailor: {  } }
    end

    assert_redirected_to photohavesailor_url(Photohavesailor.last)
  end

  test "should show photohavesailor" do
    get photohavesailor_url(@photohavesailor)
    assert_response :success
  end

  test "should get edit" do
    get edit_photohavesailor_url(@photohavesailor)
    assert_response :success
  end

  test "should update photohavesailor" do
    patch photohavesailor_url(@photohavesailor), params: { photohavesailor: {  } }
    assert_redirected_to photohavesailor_url(@photohavesailor)
  end

  test "should destroy photohavesailor" do
    assert_difference('Photohavesailor.count', -1) do
      delete photohavesailor_url(@photohavesailor)
    end

    assert_redirected_to photohavesailors_url
  end
end
