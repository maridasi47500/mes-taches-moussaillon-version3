require 'test_helper'

class OlympiceventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @olympicevent = olympicevents(:one)
  end

  test "should get index" do
    get olympicevents_url
    assert_response :success
  end

  test "should get new" do
    get new_olympicevent_url
    assert_response :success
  end

  test "should create olympicevent" do
    assert_difference('Olympicevent.count') do
      post olympicevents_url, params: { olympicevent: { name: @olympicevent.name } }
    end

    assert_redirected_to olympicevent_url(Olympicevent.last)
  end

  test "should show olympicevent" do
    get olympicevent_url(@olympicevent)
    assert_response :success
  end

  test "should get edit" do
    get edit_olympicevent_url(@olympicevent)
    assert_response :success
  end

  test "should update olympicevent" do
    patch olympicevent_url(@olympicevent), params: { olympicevent: { name: @olympicevent.name } }
    assert_redirected_to olympicevent_url(@olympicevent)
  end

  test "should destroy olympicevent" do
    assert_difference('Olympicevent.count', -1) do
      delete olympicevent_url(@olympicevent)
    end

    assert_redirected_to olympicevents_url
  end
end
