require 'test_helper'

class FetesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fete = fetes(:one)
  end

  test "should get index" do
    get fetes_url
    assert_response :success
  end

  test "should get new" do
    get new_fete_url
    assert_response :success
  end

  test "should create fete" do
    assert_difference('Fete.count') do
      post fetes_url, params: { fete: { date: @fete.date, name_de: @fete.name_de, name_en: @fete.name_en, name_fr: @fete.name_fr } }
    end

    assert_redirected_to fete_url(Fete.last)
  end

  test "should show fete" do
    get fete_url(@fete)
    assert_response :success
  end

  test "should get edit" do
    get edit_fete_url(@fete)
    assert_response :success
  end

  test "should update fete" do
    patch fete_url(@fete), params: { fete: { date: @fete.date, name_de: @fete.name_de, name_en: @fete.name_en, name_fr: @fete.name_fr } }
    assert_redirected_to fete_url(@fete)
  end

  test "should destroy fete" do
    assert_difference('Fete.count', -1) do
      delete fete_url(@fete)
    end

    assert_redirected_to fetes_url
  end
end
