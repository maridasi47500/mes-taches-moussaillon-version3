require 'test_helper'

class HistoricaleventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historicalevent = historicalevents(:one)
  end

  test "should get index" do
    get historicalevents_url
    assert_response :success
  end

  test "should get new" do
    get new_historicalevent_url
    assert_response :success
  end

  test "should create historicalevent" do
    assert_difference('Historicalevent.count') do
      post historicalevents_url, params: { historicalevent: { image: @historicalevent.image, name: @historicalevent.name } }
    end

    assert_redirected_to historicalevent_url(Historicalevent.last)
  end

  test "should show historicalevent" do
    get historicalevent_url(@historicalevent)
    assert_response :success
  end

  test "should get edit" do
    get edit_historicalevent_url(@historicalevent)
    assert_response :success
  end

  test "should update historicalevent" do
    patch historicalevent_url(@historicalevent), params: { historicalevent: { image: @historicalevent.image, name: @historicalevent.name } }
    assert_redirected_to historicalevent_url(@historicalevent)
  end

  test "should destroy historicalevent" do
    assert_difference('Historicalevent.count', -1) do
      delete historicalevent_url(@historicalevent)
    end

    assert_redirected_to historicalevents_url
  end
end
