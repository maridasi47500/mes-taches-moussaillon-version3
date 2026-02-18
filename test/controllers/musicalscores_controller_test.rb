require 'test_helper'

class MusicalscoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @musicalscore = musicalscores(:one)
  end

  test "should get index" do
    get musicalscores_url
    assert_response :success
  end

  test "should get new" do
    get new_musicalscore_url
    assert_response :success
  end

  test "should create musicalscore" do
    assert_difference('Musicalscore.count') do
      post musicalscores_url, params: { musicalscore: { description: @musicalscore.description, image: @musicalscore.image, name: @musicalscore.name } }
    end

    assert_redirected_to musicalscore_url(Musicalscore.last)
  end

  test "should show musicalscore" do
    get musicalscore_url(@musicalscore)
    assert_response :success
  end

  test "should get edit" do
    get edit_musicalscore_url(@musicalscore)
    assert_response :success
  end

  test "should update musicalscore" do
    patch musicalscore_url(@musicalscore), params: { musicalscore: { description: @musicalscore.description, image: @musicalscore.image, name: @musicalscore.name } }
    assert_redirected_to musicalscore_url(@musicalscore)
  end

  test "should destroy musicalscore" do
    assert_difference('Musicalscore.count', -1) do
      delete musicalscore_url(@musicalscore)
    end

    assert_redirected_to musicalscores_url
  end
end
