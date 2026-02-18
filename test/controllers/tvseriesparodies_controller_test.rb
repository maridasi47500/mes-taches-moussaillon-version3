require 'test_helper'

class TvseriesparodiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tvseriesparody = tvseriesparodies(:one)
  end

  test "should get index" do
    get tvseriesparodies_url
    assert_response :success
  end

  test "should get new" do
    get new_tvseriesparody_url
    assert_response :success
  end

  test "should create tvseriesparody" do
    assert_difference('Tvseriesparodie.count') do
      post tvseriesparodies_url, params: { tvseriesparody: { image: @tvseriesparody.image, name_de: @tvseriesparody.name_de, name_en: @tvseriesparody.name_en, name_fr: @tvseriesparody.name_fr } }
    end

    assert_redirected_to tvseriesparody_url(Tvseriesparodie.last)
  end

  test "should show tvseriesparody" do
    get tvseriesparody_url(@tvseriesparody)
    assert_response :success
  end

  test "should get edit" do
    get edit_tvseriesparody_url(@tvseriesparody)
    assert_response :success
  end

  test "should update tvseriesparody" do
    patch tvseriesparody_url(@tvseriesparody), params: { tvseriesparody: { image: @tvseriesparody.image, name_de: @tvseriesparody.name_de, name_en: @tvseriesparody.name_en, name_fr: @tvseriesparody.name_fr } }
    assert_redirected_to tvseriesparody_url(@tvseriesparody)
  end

  test "should destroy tvseriesparody" do
    assert_difference('Tvseriesparodie.count', -1) do
      delete tvseriesparody_url(@tvseriesparody)
    end

    assert_redirected_to tvseriesparodies_url
  end
end
