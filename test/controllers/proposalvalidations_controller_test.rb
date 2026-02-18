require 'test_helper'

class ProposalvalidationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposalvalidation = proposalvalidations(:one)
  end

  test "should get index" do
    get proposalvalidations_url
    assert_response :success
  end

  test "should get new" do
    get new_proposalvalidation_url
    assert_response :success
  end

  test "should create proposalvalidation" do
    assert_difference('Proposalvalidation.count') do
      post proposalvalidations_url, params: { proposalvalidation: { content: @proposalvalidation.content, proposal_id: @proposalvalidation.proposal_id, user_id: @proposalvalidation.user_id, validated: @proposalvalidation.validated } }
    end

    assert_redirected_to proposalvalidation_url(Proposalvalidation.last)
  end

  test "should show proposalvalidation" do
    get proposalvalidation_url(@proposalvalidation)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposalvalidation_url(@proposalvalidation)
    assert_response :success
  end

  test "should update proposalvalidation" do
    patch proposalvalidation_url(@proposalvalidation), params: { proposalvalidation: { content: @proposalvalidation.content, proposal_id: @proposalvalidation.proposal_id, user_id: @proposalvalidation.user_id, validated: @proposalvalidation.validated } }
    assert_redirected_to proposalvalidation_url(@proposalvalidation)
  end

  test "should destroy proposalvalidation" do
    assert_difference('Proposalvalidation.count', -1) do
      delete proposalvalidation_url(@proposalvalidation)
    end

    assert_redirected_to proposalvalidations_url
  end
end
