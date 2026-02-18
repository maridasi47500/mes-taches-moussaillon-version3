require "application_system_test_case"

class AnswerinvitesTest < ApplicationSystemTestCase
  setup do
    @answerinvite = answerinvites(:one)
  end

  test "visiting the index" do
    visit answerinvites_url
    assert_selector "h1", text: "Answerinvites"
  end

  test "creating a Answerinvite" do
    visit answerinvites_url
    click_on "New Answerinvite"

    fill_in "Content", with: @answerinvite.content
    fill_in "Invite", with: @answerinvite.invite_id
    fill_in "Person", with: @answerinvite.person_id
    click_on "Create Answerinvite"

    assert_text "Answerinvite was successfully created"
    click_on "Back"
  end

  test "updating a Answerinvite" do
    visit answerinvites_url
    click_on "Edit", match: :first

    fill_in "Content", with: @answerinvite.content
    fill_in "Invite", with: @answerinvite.invite_id
    fill_in "Person", with: @answerinvite.person_id
    click_on "Update Answerinvite"

    assert_text "Answerinvite was successfully updated"
    click_on "Back"
  end

  test "destroying a Answerinvite" do
    visit answerinvites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Answerinvite was successfully destroyed"
  end
end
