require 'test_helper'

class GithubreposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @githubrepo = githubrepos(:one)
  end

  test "should get index" do
    get githubrepos_url
    assert_response :success
  end

  test "should get new" do
    get new_githubrepo_url
    assert_response :success
  end

  test "should create githubrepo" do
    assert_difference('Githubrepo.count') do
      post githubrepos_url, params: { githubrepo: { githubrepo_id: @githubrepo.githubrepo_id, name: @githubrepo.name } }
    end

    assert_redirected_to githubrepo_url(Githubrepo.last)
  end

  test "should show githubrepo" do
    get githubrepo_url(@githubrepo)
    assert_response :success
  end

  test "should get edit" do
    get edit_githubrepo_url(@githubrepo)
    assert_response :success
  end

  test "should update githubrepo" do
    patch githubrepo_url(@githubrepo), params: { githubrepo: { githubrepo_id: @githubrepo.githubrepo_id, name: @githubrepo.name } }
    assert_redirected_to githubrepo_url(@githubrepo)
  end

  test "should destroy githubrepo" do
    assert_difference('Githubrepo.count', -1) do
      delete githubrepo_url(@githubrepo)
    end

    assert_redirected_to githubrepos_url
  end
end
