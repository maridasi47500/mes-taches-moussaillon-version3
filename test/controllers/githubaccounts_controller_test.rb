require 'test_helper'

class GithubaccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @githubaccount = githubaccounts(:one)
  end

  test "should get index" do
    get githubaccounts_url
    assert_response :success
  end

  test "should get new" do
    get new_githubaccount_url
    assert_response :success
  end

  test "should create githubaccount" do
    assert_difference('Githubaccount.count') do
      post githubaccounts_url, params: { githubaccount: { nameowner: @githubaccount.nameowner, person_id: @githubaccount.person_id, username: @githubaccount.username } }
    end

    assert_redirected_to githubaccount_url(Githubaccount.last)
  end

  test "should show githubaccount" do
    get githubaccount_url(@githubaccount)
    assert_response :success
  end

  test "should get edit" do
    get edit_githubaccount_url(@githubaccount)
    assert_response :success
  end

  test "should update githubaccount" do
    patch githubaccount_url(@githubaccount), params: { githubaccount: { nameowner: @githubaccount.nameowner, person_id: @githubaccount.person_id, username: @githubaccount.username } }
    assert_redirected_to githubaccount_url(@githubaccount)
  end

  test "should destroy githubaccount" do
    assert_difference('Githubaccount.count', -1) do
      delete githubaccount_url(@githubaccount)
    end

    assert_redirected_to githubaccounts_url
  end
end
