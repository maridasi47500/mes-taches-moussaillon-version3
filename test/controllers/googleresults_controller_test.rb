require 'test_helper'

class GoogleresultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @googleresult = googleresults(:one)
  end

  test "should get index" do
    get googleresults_url
    assert_response :success
  end

  test "should get new" do
    get new_googleresult_url
    assert_response :success
  end

  test "should create googleresult" do
    assert_difference('Googleresult.count') do
      post googleresults_url, params: { googleresult: { content: @googleresult.content } }
    end

    assert_redirected_to googleresult_url(Googleresult.last)
  end

  test "should show googleresult" do
    get googleresult_url(@googleresult)
    assert_response :success
  end

  test "should get edit" do
    get edit_googleresult_url(@googleresult)
    assert_response :success
  end

  test "should update googleresult" do
    patch googleresult_url(@googleresult), params: { googleresult: { content: @googleresult.content } }
    assert_redirected_to googleresult_url(@googleresult)
  end

  test "should destroy googleresult" do
    assert_difference('Googleresult.count', -1) do
      delete googleresult_url(@googleresult)
    end

    assert_redirected_to googleresults_url
  end
end
