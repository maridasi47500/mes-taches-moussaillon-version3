require 'test_helper'

class OlympicpeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @olympicperson = olympicpeople(:one)
  end

  test "should get index" do
    get olympicpeople_url
    assert_response :success
  end

  test "should get new" do
    get new_olympicperson_url
    assert_response :success
  end

  test "should create olympicperson" do
    assert_difference('Olympicperson.count') do
      post olympicpeople_url, params: { olympicperson: { otherperson_id: @olympicperson.otherperson_id, person_id: @olympicperson.person_id, skill_id: @olympicperson.skill_id } }
    end

    assert_redirected_to olympicperson_url(Olympicperson.last)
  end

  test "should show olympicperson" do
    get olympicperson_url(@olympicperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_olympicperson_url(@olympicperson)
    assert_response :success
  end

  test "should update olympicperson" do
    patch olympicperson_url(@olympicperson), params: { olympicperson: { otherperson_id: @olympicperson.otherperson_id, person_id: @olympicperson.person_id, skill_id: @olympicperson.skill_id } }
    assert_redirected_to olympicperson_url(@olympicperson)
  end

  test "should destroy olympicperson" do
    assert_difference('Olympicperson.count', -1) do
      delete olympicperson_url(@olympicperson)
    end

    assert_redirected_to olympicpeople_url
  end
end
