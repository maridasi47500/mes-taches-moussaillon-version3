require 'test_helper'

class CitynewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @citynews = citynews(:one)
  end

  test "should get index" do
    get citynews_index_url
    assert_response :success
  end

  test "should get new" do
    get new_citynews_url
    assert_response :success
  end

  test "should create citynews" do
    assert_difference('Citynews.count') do
      post citynews_index_url, params: { citynews: {  } }
    end

    assert_redirected_to citynews_url(Citynews.last)
  end

  test "should show citynews" do
    get citynews_url(@citynews)
    assert_response :success
  end

  test "should get edit" do
    get edit_citynews_url(@citynews)
    assert_response :success
  end

  test "should update citynews" do
    patch citynews_url(@citynews), params: { citynews: {  } }
    assert_redirected_to citynews_url(@citynews)
  end

  test "should destroy citynews" do
    assert_difference('Citynews.count', -1) do
      delete citynews_url(@citynews)
    end

    assert_redirected_to citynews_index_url
  end
end
