require 'test_helper'

class LinkspousepeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linkspouseperson = linkspousepeople(:one)
  end

  test "should get index" do
    get linkspousepeople_url
    assert_response :success
  end

  test "should get new" do
    get new_linkspouseperson_url
    assert_response :success
  end

  test "should create linkspouseperson" do
    assert_difference('Linkspouseperson.count') do
      post linkspousepeople_url, params: { linkspouseperson: { otherperson_id: @linkspouseperson.otherperson_id, person_id: @linkspouseperson.person_id, spouselink_id: @linkspouseperson.spouselink_id } }
    end

    assert_redirected_to linkspouseperson_url(Linkspouseperson.last)
  end

  test "should show linkspouseperson" do
    get linkspouseperson_url(@linkspouseperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_linkspouseperson_url(@linkspouseperson)
    assert_response :success
  end

  test "should update linkspouseperson" do
    patch linkspouseperson_url(@linkspouseperson), params: { linkspouseperson: { otherperson_id: @linkspouseperson.otherperson_id, person_id: @linkspouseperson.person_id, spouselink_id: @linkspouseperson.spouselink_id } }
    assert_redirected_to linkspouseperson_url(@linkspouseperson)
  end

  test "should destroy linkspouseperson" do
    assert_difference('Linkspouseperson.count', -1) do
      delete linkspouseperson_url(@linkspouseperson)
    end

    assert_redirected_to linkspousepeople_url
  end
end
