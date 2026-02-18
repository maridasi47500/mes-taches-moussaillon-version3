require 'test_helper'

class PhotoshavethingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photoshavething = photoshavethings(:one)
  end

  test "should get index" do
    get photoshavethings_url
    assert_response :success
  end

  test "should get new" do
    get new_photoshavething_url
    assert_response :success
  end

  test "should create photoshavething" do
    assert_difference('Photoshavething.count') do
      post photoshavethings_url, params: { photoshavething: { photo_id: @photoshavething.photo_id, thing_id: @photoshavething.thing_id } }
    end

    assert_redirected_to photoshavething_url(Photoshavething.last)
  end

  test "should show photoshavething" do
    get photoshavething_url(@photoshavething)
    assert_response :success
  end

  test "should get edit" do
    get edit_photoshavething_url(@photoshavething)
    assert_response :success
  end

  test "should update photoshavething" do
    patch photoshavething_url(@photoshavething), params: { photoshavething: { photo_id: @photoshavething.photo_id, thing_id: @photoshavething.thing_id } }
    assert_redirected_to photoshavething_url(@photoshavething)
  end

  test "should destroy photoshavething" do
    assert_difference('Photoshavething.count', -1) do
      delete photoshavething_url(@photoshavething)
    end

    assert_redirected_to photoshavethings_url
  end
end
