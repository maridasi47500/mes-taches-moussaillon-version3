require 'test_helper'

class WorktwosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @worktwo = worktwos(:one)
  end

  test "should get index" do
    get worktwos_url
    assert_response :success
  end

  test "should get new" do
    get new_worktwo_url
    assert_response :success
  end

  test "should create worktwo" do
    assert_difference('Worktwo.count') do
      post worktwos_url, params: { worktwo: { link: @worktwo.link, otherperson_id: @worktwo.otherperson_id, person_id: @worktwo.person_id } }
    end

    assert_redirected_to worktwo_url(Worktwo.last)
  end

  test "should show worktwo" do
    get worktwo_url(@worktwo)
    assert_response :success
  end

  test "should get edit" do
    get edit_worktwo_url(@worktwo)
    assert_response :success
  end

  test "should update worktwo" do
    patch worktwo_url(@worktwo), params: { worktwo: { link: @worktwo.link, otherperson_id: @worktwo.otherperson_id, person_id: @worktwo.person_id } }
    assert_redirected_to worktwo_url(@worktwo)
  end

  test "should destroy worktwo" do
    assert_difference('Worktwo.count', -1) do
      delete worktwo_url(@worktwo)
    end

    assert_redirected_to worktwos_url
  end
end
