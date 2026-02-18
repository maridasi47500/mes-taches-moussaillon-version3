require 'test_helper'

class HernothersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hernother = hernothers(:one)
  end

  test "should get index" do
    get hernothers_url
    assert_response :success
  end

  test "should get new" do
    get new_hernother_url
    assert_response :success
  end

  test "should create hernother" do
    assert_difference('Hernother.count') do
      post hernothers_url, params: { hernother: { otherperson_id: @hernother.otherperson_id, person_id: @hernother.person_id } }
    end

    assert_redirected_to hernother_url(Hernother.last)
  end

  test "should show hernother" do
    get hernother_url(@hernother)
    assert_response :success
  end

  test "should get edit" do
    get edit_hernother_url(@hernother)
    assert_response :success
  end

  test "should update hernother" do
    patch hernother_url(@hernother), params: { hernother: { otherperson_id: @hernother.otherperson_id, person_id: @hernother.person_id } }
    assert_redirected_to hernother_url(@hernother)
  end

  test "should destroy hernother" do
    assert_difference('Hernother.count', -1) do
      delete hernother_url(@hernother)
    end

    assert_redirected_to hernothers_url
  end
end
