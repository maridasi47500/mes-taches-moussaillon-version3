require 'test_helper'

class TogethertvseriesratingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @togethertvseriesrating = togethertvseriesratings(:one)
  end

  test "should get index" do
    get togethertvseriesratings_url
    assert_response :success
  end

  test "should get new" do
    get new_togethertvseriesrating_url
    assert_response :success
  end

  test "should create togethertvseriesrating" do
    assert_difference('Togethertvseriesrating.count') do
      post togethertvseriesratings_url, params: { togethertvseriesrating: { content_de: @togethertvseriesrating.content_de, content_en: @togethertvseriesrating.content_en, content_fr: @togethertvseriesrating.content_fr, rating: @togethertvseriesrating.rating, tvserieshaveactor_id: @togethertvseriesrating.tvserieshaveactor_id, user_id: @togethertvseriesrating.user_id } }
    end

    assert_redirected_to togethertvseriesrating_url(Togethertvseriesrating.last)
  end

  test "should show togethertvseriesrating" do
    get togethertvseriesrating_url(@togethertvseriesrating)
    assert_response :success
  end

  test "should get edit" do
    get edit_togethertvseriesrating_url(@togethertvseriesrating)
    assert_response :success
  end

  test "should update togethertvseriesrating" do
    patch togethertvseriesrating_url(@togethertvseriesrating), params: { togethertvseriesrating: { content_de: @togethertvseriesrating.content_de, content_en: @togethertvseriesrating.content_en, content_fr: @togethertvseriesrating.content_fr, rating: @togethertvseriesrating.rating, tvserieshaveactor_id: @togethertvseriesrating.tvserieshaveactor_id, user_id: @togethertvseriesrating.user_id } }
    assert_redirected_to togethertvseriesrating_url(@togethertvseriesrating)
  end

  test "should destroy togethertvseriesrating" do
    assert_difference('Togethertvseriesrating.count', -1) do
      delete togethertvseriesrating_url(@togethertvseriesrating)
    end

    assert_redirected_to togethertvseriesratings_url
  end
end
