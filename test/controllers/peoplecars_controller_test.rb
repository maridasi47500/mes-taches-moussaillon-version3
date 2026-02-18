require 'test_helper'

class PeoplecarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peoplecar = peoplecars(:one)
  end

  test "should get index" do
    get peoplecars_url
    assert_response :success
  end

  test "should get new" do
    get new_peoplecar_url
    assert_response :success
  end

  test "should create peoplecar" do
    assert_difference('Peoplecar.count') do
      post peoplecars_url, params: { peoplecar: { car_id: @peoplecar.car_id, person_id: @peoplecar.person_id, user_id: @peoplecar.user_id } }
    end

    assert_redirected_to peoplecar_url(Peoplecar.last)
  end

  test "should show peoplecar" do
    get peoplecar_url(@peoplecar)
    assert_response :success
  end

  test "should get edit" do
    get edit_peoplecar_url(@peoplecar)
    assert_response :success
  end

  test "should update peoplecar" do
    patch peoplecar_url(@peoplecar), params: { peoplecar: { car_id: @peoplecar.car_id, person_id: @peoplecar.person_id, user_id: @peoplecar.user_id } }
    assert_redirected_to peoplecar_url(@peoplecar)
  end

  test "should destroy peoplecar" do
    assert_difference('Peoplecar.count', -1) do
      delete peoplecar_url(@peoplecar)
    end

    assert_redirected_to peoplecars_url
  end
end
