require 'test_helper'

class LinkpeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linkperson = linkpeople(:one)
  end

  test "should get index" do
    get linkpeople_url
    assert_response :success
  end

  test "should get new" do
    get new_linkperson_url
    assert_response :success
  end

  test "should create linkperson" do
    assert_difference('Linkperson.count') do
      post linkpeople_url, params: { linkperson: { name_de: @linkperson.name_de, name_en: @linkperson.name_en, name_fr: @linkperson.name_fr } }
    end

    assert_redirected_to linkperson_url(Linkperson.last)
  end

  test "should show linkperson" do
    get linkperson_url(@linkperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_linkperson_url(@linkperson)
    assert_response :success
  end

  test "should update linkperson" do
    patch linkperson_url(@linkperson), params: { linkperson: { name_de: @linkperson.name_de, name_en: @linkperson.name_en, name_fr: @linkperson.name_fr } }
    assert_redirected_to linkperson_url(@linkperson)
  end

  test "should destroy linkperson" do
    assert_difference('Linkperson.count', -1) do
      delete linkperson_url(@linkperson)
    end

    assert_redirected_to linkpeople_url
  end
end
