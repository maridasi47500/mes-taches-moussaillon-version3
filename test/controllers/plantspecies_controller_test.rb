require 'test_helper'

class PlantspeciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plantspecy = plantspecies(:one)
  end

  test "should get index" do
    get plantspecies_url
    assert_response :success
  end

  test "should get new" do
    get new_plantspecy_url
    assert_response :success
  end

  test "should create plantspecy" do
    assert_difference('Plantspecie.count') do
      post plantspecies_url, params: { plantspecy: { image: @plantspecy.image, name: @plantspecy.name } }
    end

    assert_redirected_to plantspecy_url(Plantspecie.last)
  end

  test "should show plantspecy" do
    get plantspecy_url(@plantspecy)
    assert_response :success
  end

  test "should get edit" do
    get edit_plantspecy_url(@plantspecy)
    assert_response :success
  end

  test "should update plantspecy" do
    patch plantspecy_url(@plantspecy), params: { plantspecy: { image: @plantspecy.image, name: @plantspecy.name } }
    assert_redirected_to plantspecy_url(@plantspecy)
  end

  test "should destroy plantspecy" do
    assert_difference('Plantspecie.count', -1) do
      delete plantspecy_url(@plantspecy)
    end

    assert_redirected_to plantspecies_url
  end
end
