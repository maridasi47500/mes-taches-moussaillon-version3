require 'test_helper'

class PersonhavelifestateshaverequeststopeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personhavelifestateshaverequeststoperson = personhavelifestateshaverequeststopeople(:one)
  end

  test "should get index" do
    get personhavelifestateshaverequeststopeople_url
    assert_response :success
  end

  test "should get new" do
    get new_personhavelifestateshaverequeststoperson_url
    assert_response :success
  end

  test "should create personhavelifestateshaverequeststoperson" do
    assert_difference('Personhavelifestateshaverequeststoperson.count') do
      post personhavelifestateshaverequeststopeople_url, params: { personhavelifestateshaverequeststoperson: { personhavelifestate_id: @personhavelifestateshaverequeststoperson.personhavelifestate_id, requeststoperson_id: @personhavelifestateshaverequeststoperson.requeststoperson_id } }
    end

    assert_redirected_to personhavelifestateshaverequeststoperson_url(Personhavelifestateshaverequeststoperson.last)
  end

  test "should show personhavelifestateshaverequeststoperson" do
    get personhavelifestateshaverequeststoperson_url(@personhavelifestateshaverequeststoperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_personhavelifestateshaverequeststoperson_url(@personhavelifestateshaverequeststoperson)
    assert_response :success
  end

  test "should update personhavelifestateshaverequeststoperson" do
    patch personhavelifestateshaverequeststoperson_url(@personhavelifestateshaverequeststoperson), params: { personhavelifestateshaverequeststoperson: { personhavelifestate_id: @personhavelifestateshaverequeststoperson.personhavelifestate_id, requeststoperson_id: @personhavelifestateshaverequeststoperson.requeststoperson_id } }
    assert_redirected_to personhavelifestateshaverequeststoperson_url(@personhavelifestateshaverequeststoperson)
  end

  test "should destroy personhavelifestateshaverequeststoperson" do
    assert_difference('Personhavelifestateshaverequeststoperson.count', -1) do
      delete personhavelifestateshaverequeststoperson_url(@personhavelifestateshaverequeststoperson)
    end

    assert_redirected_to personhavelifestateshaverequeststopeople_url
  end
end
