require 'test_helper'

class AnswerinvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answerinvite = answerinvites(:one)
  end

  test "should get index" do
    get answerinvites_url
    assert_response :success
  end

  test "should get new" do
    get new_answerinvite_url
    assert_response :success
  end

  test "should create answerinvite" do
    assert_difference('Answerinvite.count') do
      post answerinvites_url, params: { answerinvite: { content: @answerinvite.content, invite_id: @answerinvite.invite_id, person_id: @answerinvite.person_id } }
    end

    assert_redirected_to answerinvite_url(Answerinvite.last)
  end

  test "should show answerinvite" do
    get answerinvite_url(@answerinvite)
    assert_response :success
  end

  test "should get edit" do
    get edit_answerinvite_url(@answerinvite)
    assert_response :success
  end

  test "should update answerinvite" do
    patch answerinvite_url(@answerinvite), params: { answerinvite: { content: @answerinvite.content, invite_id: @answerinvite.invite_id, person_id: @answerinvite.person_id } }
    assert_redirected_to answerinvite_url(@answerinvite)
  end

  test "should destroy answerinvite" do
    assert_difference('Answerinvite.count', -1) do
      delete answerinvite_url(@answerinvite)
    end

    assert_redirected_to answerinvites_url
  end
end
