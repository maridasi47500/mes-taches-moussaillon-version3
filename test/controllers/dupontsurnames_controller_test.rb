require 'test_helper'

class DupontsurnamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dupontsurname = dupontsurnames(:one)
  end

  test "should get index" do
    get dupontsurnames_url
    assert_response :success
  end

  test "should get new" do
    get new_dupontsurname_url
    assert_response :success
  end

  test "should create dupontsurname" do
    assert_difference('Dupontsurname.count') do
      post dupontsurnames_url, params: { dupontsurname: { name: @dupontsurname.name } }
    end

    assert_redirected_to dupontsurname_url(Dupontsurname.last)
  end

  test "should show dupontsurname" do
    get dupontsurname_url(@dupontsurname)
    assert_response :success
  end

  test "should get edit" do
    get edit_dupontsurname_url(@dupontsurname)
    assert_response :success
  end

  test "should update dupontsurname" do
    patch dupontsurname_url(@dupontsurname), params: { dupontsurname: { name: @dupontsurname.name } }
    assert_redirected_to dupontsurname_url(@dupontsurname)
  end

  test "should destroy dupontsurname" do
    assert_difference('Dupontsurname.count', -1) do
      delete dupontsurname_url(@dupontsurname)
    end

    assert_redirected_to dupontsurnames_url
  end
end
