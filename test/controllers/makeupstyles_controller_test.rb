require 'test_helper'

class MakeupstylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @makeupstyle = makeupstyles(:one)
  end

  test "should get index" do
    get makeupstyles_url
    assert_response :success
  end

  test "should get new" do
    get new_makeupstyle_url
    assert_response :success
  end

  test "should create makeupstyle" do
    assert_difference('Makeupstyle.count') do
      post makeupstyles_url, params: { makeupstyle: { name: @makeupstyle.name } }
    end

    assert_redirected_to makeupstyle_url(Makeupstyle.last)
  end

  test "should show makeupstyle" do
    get makeupstyle_url(@makeupstyle)
    assert_response :success
  end

  test "should get edit" do
    get edit_makeupstyle_url(@makeupstyle)
    assert_response :success
  end

  test "should update makeupstyle" do
    patch makeupstyle_url(@makeupstyle), params: { makeupstyle: { name: @makeupstyle.name } }
    assert_redirected_to makeupstyle_url(@makeupstyle)
  end

  test "should destroy makeupstyle" do
    assert_difference('Makeupstyle.count', -1) do
      delete makeupstyle_url(@makeupstyle)
    end

    assert_redirected_to makeupstyles_url
  end
end
