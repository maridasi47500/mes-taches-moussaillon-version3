require "application_system_test_case"

class ProposalvalidationsTest < ApplicationSystemTestCase
  setup do
    @proposalvalidation = proposalvalidations(:one)
  end

  test "visiting the index" do
    visit proposalvalidations_url
    assert_selector "h1", text: "Proposalvalidations"
  end

  test "creating a Proposalvalidation" do
    visit proposalvalidations_url
    click_on "New Proposalvalidation"

    fill_in "Content", with: @proposalvalidation.content
    fill_in "Proposal", with: @proposalvalidation.proposal_id
    fill_in "User", with: @proposalvalidation.user_id
    check "Validated" if @proposalvalidation.validated
    click_on "Create Proposalvalidation"

    assert_text "Proposalvalidation was successfully created"
    click_on "Back"
  end

  test "updating a Proposalvalidation" do
    visit proposalvalidations_url
    click_on "Edit", match: :first

    fill_in "Content", with: @proposalvalidation.content
    fill_in "Proposal", with: @proposalvalidation.proposal_id
    fill_in "User", with: @proposalvalidation.user_id
    check "Validated" if @proposalvalidation.validated
    click_on "Update Proposalvalidation"

    assert_text "Proposalvalidation was successfully updated"
    click_on "Back"
  end

  test "destroying a Proposalvalidation" do
    visit proposalvalidations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proposalvalidation was successfully destroyed"
  end
end
