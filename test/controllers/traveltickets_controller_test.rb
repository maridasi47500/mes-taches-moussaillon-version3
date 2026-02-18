require 'test_helper'

class TravelticketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travelticket = traveltickets(:one)
  end

  test "should get index" do
    get traveltickets_url
    assert_response :success
  end

  test "should get new" do
    get new_travelticket_url
    assert_response :success
  end

  test "should create travelticket" do
    assert_difference('Travelticket.count') do
      post traveltickets_url, params: { travelticket: { image: @travelticket.image, name_de: @travelticket.name_de, name_en: @travelticket.name_en, name_fr: @travelticket.name_fr } }
    end

    assert_redirected_to travelticket_url(Travelticket.last)
  end

  test "should show travelticket" do
    get travelticket_url(@travelticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_travelticket_url(@travelticket)
    assert_response :success
  end

  test "should update travelticket" do
    patch travelticket_url(@travelticket), params: { travelticket: { image: @travelticket.image, name_de: @travelticket.name_de, name_en: @travelticket.name_en, name_fr: @travelticket.name_fr } }
    assert_redirected_to travelticket_url(@travelticket)
  end

  test "should destroy travelticket" do
    assert_difference('Travelticket.count', -1) do
      delete travelticket_url(@travelticket)
    end

    assert_redirected_to traveltickets_url
  end
end
