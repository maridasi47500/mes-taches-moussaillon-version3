require 'test_helper'

class TwopeoplemeetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twopeoplemeet = twopeoplemeets(:one)
  end

  test "should get index" do
    get twopeoplemeets_url
    assert_response :success
  end

  test "should get new" do
    get new_twopeoplemeet_url
    assert_response :success
  end

  test "should create twopeoplemeet" do
    assert_difference('Twopeoplemeet.count') do
      post twopeoplemeets_url, params: { twopeoplemeet: { otherperson_id: @twopeoplemeet.otherperson_id, person_id: @twopeoplemeet.person_id } }
    end

    assert_redirected_to twopeoplemeet_url(Twopeoplemeet.last)
  end

  test "should show twopeoplemeet" do
    get twopeoplemeet_url(@twopeoplemeet)
    assert_response :success
  end

  test "should get edit" do
    get edit_twopeoplemeet_url(@twopeoplemeet)
    assert_response :success
  end

  test "should update twopeoplemeet" do
    patch twopeoplemeet_url(@twopeoplemeet), params: { twopeoplemeet: { otherperson_id: @twopeoplemeet.otherperson_id, person_id: @twopeoplemeet.person_id } }
    assert_redirected_to twopeoplemeet_url(@twopeoplemeet)
  end

  test "should destroy twopeoplemeet" do
    assert_difference('Twopeoplemeet.count', -1) do
      delete twopeoplemeet_url(@twopeoplemeet)
    end

    assert_redirected_to twopeoplemeets_url
  end
end
