require 'test_helper'

class JinglesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jingle = jingles(:one)
  end

  test "should get index" do
    get jingles_url
    assert_response :success
  end

  test "should get new" do
    get new_jingle_url
    assert_response :success
  end

  test "should create jingle" do
    assert_difference('Jingle.count') do
      post jingles_url, params: { jingle: { content: @jingle.content, name: @jingle.name, posts_surname_id: @jingle.posts_surname_id } }
    end

    assert_redirected_to jingle_url(Jingle.last)
  end

  test "should show jingle" do
    get jingle_url(@jingle)
    assert_response :success
  end

  test "should get edit" do
    get edit_jingle_url(@jingle)
    assert_response :success
  end

  test "should update jingle" do
    patch jingle_url(@jingle), params: { jingle: { content: @jingle.content, name: @jingle.name, posts_surname_id: @jingle.posts_surname_id } }
    assert_redirected_to jingle_url(@jingle)
  end

  test "should destroy jingle" do
    assert_difference('Jingle.count', -1) do
      delete jingle_url(@jingle)
    end

    assert_redirected_to jingles_url
  end
end
