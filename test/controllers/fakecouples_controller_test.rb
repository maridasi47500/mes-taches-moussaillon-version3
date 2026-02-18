require 'test_helper'

class FakecouplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fakecouple = fakecouples(:one)
  end

  test "should get index" do
    get fakecouples_url
    assert_response :success
  end

  test "should get new" do
    get new_fakecouple_url
    assert_response :success
  end

  test "should create fakecouple" do
    assert_difference('Fakecouple.count') do
      post fakecouples_url, params: { fakecouple: {  } }
    end

    assert_redirected_to fakecouple_url(Fakecouple.last)
  end

  test "should show fakecouple" do
    get fakecouple_url(@fakecouple)
    assert_response :success
  end

  test "should get edit" do
    get edit_fakecouple_url(@fakecouple)
    assert_response :success
  end

  test "should update fakecouple" do
    patch fakecouple_url(@fakecouple), params: { fakecouple: {  } }
    assert_redirected_to fakecouple_url(@fakecouple)
  end

  test "should destroy fakecouple" do
    assert_difference('Fakecouple.count', -1) do
      delete fakecouple_url(@fakecouple)
    end

    assert_redirected_to fakecouples_url
  end
end
