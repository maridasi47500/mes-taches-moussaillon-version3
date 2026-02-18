require 'test_helper'

class RequeststopeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requeststoperson = requeststopeople(:one)
  end

  test "should get index" do
    get requeststopeople_url
    assert_response :success
  end

  test "should get new" do
    get new_requeststoperson_url
    assert_response :success
  end

  test "should create requeststoperson" do
    assert_difference('Requeststoperson.count') do
      post requeststopeople_url, params: { requeststoperson: { content_de: @requeststoperson.content_de, content_en: @requeststoperson.content_en, content_fr: @requeststoperson.content_fr, requestperson_id: @requeststoperson.requestperson_id } }
    end

    assert_redirected_to requeststoperson_url(Requeststoperson.last)
  end

  test "should show requeststoperson" do
    get requeststoperson_url(@requeststoperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_requeststoperson_url(@requeststoperson)
    assert_response :success
  end

  test "should update requeststoperson" do
    patch requeststoperson_url(@requeststoperson), params: { requeststoperson: { content_de: @requeststoperson.content_de, content_en: @requeststoperson.content_en, content_fr: @requeststoperson.content_fr, requestperson_id: @requeststoperson.requestperson_id } }
    assert_redirected_to requeststoperson_url(@requeststoperson)
  end

  test "should destroy requeststoperson" do
    assert_difference('Requeststoperson.count', -1) do
      delete requeststoperson_url(@requeststoperson)
    end

    assert_redirected_to requeststopeople_url
  end
end
