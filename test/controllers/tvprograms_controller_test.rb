require 'test_helper'

class TvprogramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tvprogram = tvprograms(:one)
  end

  test "should get index" do
    get tvprograms_url
    assert_response :success
  end

  test "should get new" do
    get new_tvprogram_url
    assert_response :success
  end

  test "should create tvprogram" do
    assert_difference('Tvprogram.count') do
      post tvprograms_url, params: { tvprogram: { image: @tvprogram.image, name: @tvprogram.name } }
    end

    assert_redirected_to tvprogram_url(Tvprogram.last)
  end

  test "should show tvprogram" do
    get tvprogram_url(@tvprogram)
    assert_response :success
  end

  test "should get edit" do
    get edit_tvprogram_url(@tvprogram)
    assert_response :success
  end

  test "should update tvprogram" do
    patch tvprogram_url(@tvprogram), params: { tvprogram: { image: @tvprogram.image, name: @tvprogram.name } }
    assert_redirected_to tvprogram_url(@tvprogram)
  end

  test "should destroy tvprogram" do
    assert_difference('Tvprogram.count', -1) do
      delete tvprogram_url(@tvprogram)
    end

    assert_redirected_to tvprograms_url
  end
end
