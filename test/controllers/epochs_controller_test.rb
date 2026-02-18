require 'test_helper'

class EpochsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epoch = epochs(:one)
  end

  test "should get index" do
    get epochs_url
    assert_response :success
  end

  test "should get new" do
    get new_epoch_url
    assert_response :success
  end

  test "should create epoch" do
    assert_difference('Epoch.count') do
      post epochs_url, params: { epoch: { address: @epoch.address, city_id: @epoch.city_id, country_id: @epoch.country_id, created_at: @epoch.created_at, description: @epoch.description, done: @epoch.done, end_at: @epoch.end_at, event_type_id: @epoch.event_type_id, idoit: @epoch.idoit, image: @epoch.image, latitude: @epoch.latitude, longitude: @epoch.longitude, name: @epoch.name, nbtimes: @epoch.nbtimes, place_id: @epoch.place_id, start_at: @epoch.start_at, state_id: @epoch.state_id, type: @epoch.type, updated_at: @epoch.updated_at, zoom: @epoch.zoom } }
    end

    assert_redirected_to epoch_url(Epoch.last)
  end

  test "should show epoch" do
    get epoch_url(@epoch)
    assert_response :success
  end

  test "should get edit" do
    get edit_epoch_url(@epoch)
    assert_response :success
  end

  test "should update epoch" do
    patch epoch_url(@epoch), params: { epoch: { address: @epoch.address, city_id: @epoch.city_id, country_id: @epoch.country_id, created_at: @epoch.created_at, description: @epoch.description, done: @epoch.done, end_at: @epoch.end_at, event_type_id: @epoch.event_type_id, idoit: @epoch.idoit, image: @epoch.image, latitude: @epoch.latitude, longitude: @epoch.longitude, name: @epoch.name, nbtimes: @epoch.nbtimes, place_id: @epoch.place_id, start_at: @epoch.start_at, state_id: @epoch.state_id, type: @epoch.type, updated_at: @epoch.updated_at, zoom: @epoch.zoom } }
    assert_redirected_to epoch_url(@epoch)
  end

  test "should destroy epoch" do
    assert_difference('Epoch.count', -1) do
      delete epoch_url(@epoch)
    end

    assert_redirected_to epochs_url
  end
end
