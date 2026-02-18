require 'test_helper'

class PostsSurnamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posts_surname = posts_surnames(:one)
  end

  test "should get index" do
    get posts_surnames_url
    assert_response :success
  end

  test "should get new" do
    get new_posts_surname_url
    assert_response :success
  end

  test "should create posts_surname" do
    assert_difference('PostsSurname.count') do
      post posts_surnames_url, params: { posts_surname: {  } }
    end

    assert_redirected_to posts_surname_url(PostsSurname.last)
  end

  test "should show posts_surname" do
    get posts_surname_url(@posts_surname)
    assert_response :success
  end

  test "should get edit" do
    get edit_posts_surname_url(@posts_surname)
    assert_response :success
  end

  test "should update posts_surname" do
    patch posts_surname_url(@posts_surname), params: { posts_surname: {  } }
    assert_redirected_to posts_surname_url(@posts_surname)
  end

  test "should destroy posts_surname" do
    assert_difference('PostsSurname.count', -1) do
      delete posts_surname_url(@posts_surname)
    end

    assert_redirected_to posts_surnames_url
  end
end
