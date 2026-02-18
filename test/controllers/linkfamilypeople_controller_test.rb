require 'test_helper'

class LinkfamilypeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linkfamilyperson = linkfamilypeople(:one)
  end

  test "should get index" do
    get linkfamilypeople_url
    assert_response :success
  end

  test "should get new" do
    get new_linkfamilyperson_url
    assert_response :success
  end

  test "should create linkfamilyperson" do
    assert_difference('Linkfamilyperson.count') do
      post linkfamilypeople_url, params: { linkfamilyperson: { otherperson_id: @linkfamilyperson.otherperson_id, person_id: @linkfamilyperson.person_id, spouselink_id: @linkfamilyperson.spouselink_id } }
    end

    assert_redirected_to linkfamilyperson_url(Linkfamilyperson.last)
  end

  test "should show linkfamilyperson" do
    get linkfamilyperson_url(@linkfamilyperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_linkfamilyperson_url(@linkfamilyperson)
    assert_response :success
  end

  test "should update linkfamilyperson" do
    patch linkfamilyperson_url(@linkfamilyperson), params: { linkfamilyperson: { otherperson_id: @linkfamilyperson.otherperson_id, person_id: @linkfamilyperson.person_id, spouselink_id: @linkfamilyperson.spouselink_id } }
    assert_redirected_to linkfamilyperson_url(@linkfamilyperson)
  end

  test "should destroy linkfamilyperson" do
    assert_difference('Linkfamilyperson.count', -1) do
      delete linkfamilyperson_url(@linkfamilyperson)
    end

    assert_redirected_to linkfamilypeople_url
  end
end
