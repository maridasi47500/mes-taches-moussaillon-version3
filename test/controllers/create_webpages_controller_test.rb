require 'test_helper'

class CreateWebpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_webpage = create_webpages(:one)
  end

  test "should get index" do
    get create_webpages_url
    assert_response :success
  end

  test "should get new" do
    get new_create_webpage_url
    assert_response :success
  end

  test "should create create_webpage" do
    assert_difference('CreateWebpage.count') do
      post create_webpages_url, params: { create_webpage: { title: @create_webpage.title, url: @create_webpage.url } }
    end

    assert_redirected_to create_webpage_url(CreateWebpage.last)
  end

  test "should show create_webpage" do
    get create_webpage_url(@create_webpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_webpage_url(@create_webpage)
    assert_response :success
  end

  test "should update create_webpage" do
    patch create_webpage_url(@create_webpage), params: { create_webpage: { title: @create_webpage.title, url: @create_webpage.url } }
    assert_redirected_to create_webpage_url(@create_webpage)
  end

  test "should destroy create_webpage" do
    assert_difference('CreateWebpage.count', -1) do
      delete create_webpage_url(@create_webpage)
    end

    assert_redirected_to create_webpages_url
  end
end
