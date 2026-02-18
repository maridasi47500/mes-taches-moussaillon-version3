require 'test_helper'

class MydocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mydoc = mydocs(:one)
  end

  test "should get index" do
    get mydocs_url
    assert_response :success
  end

  test "should get new" do
    get new_mydoc_url
    assert_response :success
  end

  test "should create mydoc" do
    assert_difference('Mydoc.count') do
      post mydocs_url, params: { mydoc: { action: @mydoc.action, content: @mydoc.content, controller: @mydoc.controller, user_id: @mydoc.user_id } }
    end

    assert_redirected_to mydoc_url(Mydoc.last)
  end

  test "should show mydoc" do
    get mydoc_url(@mydoc)
    assert_response :success
  end

  test "should get edit" do
    get edit_mydoc_url(@mydoc)
    assert_response :success
  end

  test "should update mydoc" do
    patch mydoc_url(@mydoc), params: { mydoc: { action: @mydoc.action, content: @mydoc.content, controller: @mydoc.controller, user_id: @mydoc.user_id } }
    assert_redirected_to mydoc_url(@mydoc)
  end

  test "should destroy mydoc" do
    assert_difference('Mydoc.count', -1) do
      delete mydoc_url(@mydoc)
    end

    assert_redirected_to mydocs_url
  end
end
