require 'test_helper'

class EditionshaveeventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @editionshaveevent = editionshaveevents(:one)
  end

  test "should get index" do
    get editionshaveevents_url
    assert_response :success
  end

  test "should get new" do
    get new_editionshaveevent_url
    assert_response :success
  end

  test "should create editionshaveevent" do
    assert_difference('Editionshaveevent.count') do
      post editionshaveevents_url, params: { editionshaveevent: { city: @editionshaveevent.city, country: @editionshaveevent.country, date: @editionshaveevent.date, edition: @editionshaveevent.edition, olympicevent: @editionshaveevent.olympicevent, sexe: @editionshaveevent.sexe } }
    end

    assert_redirected_to editionshaveevent_url(Editionshaveevent.last)
  end

  test "should show editionshaveevent" do
    get editionshaveevent_url(@editionshaveevent)
    assert_response :success
  end

  test "should get edit" do
    get edit_editionshaveevent_url(@editionshaveevent)
    assert_response :success
  end

  test "should update editionshaveevent" do
    patch editionshaveevent_url(@editionshaveevent), params: { editionshaveevent: { city: @editionshaveevent.city, country: @editionshaveevent.country, date: @editionshaveevent.date, edition: @editionshaveevent.edition, olympicevent: @editionshaveevent.olympicevent, sexe: @editionshaveevent.sexe } }
    assert_redirected_to editionshaveevent_url(@editionshaveevent)
  end

  test "should destroy editionshaveevent" do
    assert_difference('Editionshaveevent.count', -1) do
      delete editionshaveevent_url(@editionshaveevent)
    end

    assert_redirected_to editionshaveevents_url
  end
end
