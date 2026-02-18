require 'test_helper'

class FakelinksfamilypeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fakelinksfamilyperson = fakelinksfamilypeople(:one)
  end

  test "should get index" do
    get fakelinksfamilypeople_url
    assert_response :success
  end

  test "should get new" do
    get new_fakelinksfamilyperson_url
    assert_response :success
  end

  test "should create fakelinksfamilyperson" do
    assert_difference('Fakelinksfamilyperson.count') do
      post fakelinksfamilypeople_url, params: { fakelinksfamilyperson: { familylink_id: @fakelinksfamilyperson.familylink_id, twoperson_id: @fakelinksfamilyperson.twoperson_id, user_id: @fakelinksfamilyperson.user_id } }
    end

    assert_redirected_to fakelinksfamilyperson_url(Fakelinksfamilyperson.last)
  end

  test "should show fakelinksfamilyperson" do
    get fakelinksfamilyperson_url(@fakelinksfamilyperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_fakelinksfamilyperson_url(@fakelinksfamilyperson)
    assert_response :success
  end

  test "should update fakelinksfamilyperson" do
    patch fakelinksfamilyperson_url(@fakelinksfamilyperson), params: { fakelinksfamilyperson: { familylink_id: @fakelinksfamilyperson.familylink_id, twoperson_id: @fakelinksfamilyperson.twoperson_id, user_id: @fakelinksfamilyperson.user_id } }
    assert_redirected_to fakelinksfamilyperson_url(@fakelinksfamilyperson)
  end

  test "should destroy fakelinksfamilyperson" do
    assert_difference('Fakelinksfamilyperson.count', -1) do
      delete fakelinksfamilyperson_url(@fakelinksfamilyperson)
    end

    assert_redirected_to fakelinksfamilypeople_url
  end
end
