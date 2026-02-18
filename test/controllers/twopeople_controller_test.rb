require 'test_helper'

class TwopeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twoperson = twopeople(:one)
  end

  test "should get index" do
    get twopeople_url
    assert_response :success
  end

  test "should get new" do
    get new_twoperson_url
    assert_response :success
  end

  test "should create twoperson" do
    assert_difference('Twoperson.count') do
      post twopeople_url, params: { twoperson: { otherperson_id: @twoperson.otherperson_id, person_id: @twoperson.person_id } }
    end

    assert_redirected_to twoperson_url(Twoperson.last)
  end

  test "should show twoperson" do
    get twoperson_url(@twoperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_twoperson_url(@twoperson)
    assert_response :success
  end

  test "should update twoperson" do
    patch twoperson_url(@twoperson), params: { twoperson: { otherperson_id: @twoperson.otherperson_id, person_id: @twoperson.person_id } }
    assert_redirected_to twoperson_url(@twoperson)
  end

  test "should destroy twoperson" do
    assert_difference('Twoperson.count', -1) do
      delete twoperson_url(@twoperson)
    end

    assert_redirected_to twopeople_url
  end
end
