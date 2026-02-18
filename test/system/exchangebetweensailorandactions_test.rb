require "application_system_test_case"

class ExchangebetweensailorandactionsTest < ApplicationSystemTestCase
  setup do
    @exchangebetweensailorandaction = exchangebetweensailorandactions(:one)
  end

  test "visiting the index" do
    visit exchangebetweensailorandactions_url
    assert_selector "h1", text: "Exchangebetweensailorandactions"
  end

  test "creating a Exchangebetweensailorandaction" do
    visit exchangebetweensailorandactions_url
    click_on "New Exchangebetweensailorandaction"

    fill_in "Person", with: @exchangebetweensailorandaction.person_id
    fill_in "Sailorandaction", with: @exchangebetweensailorandaction.sailorandaction_id
    click_on "Create Exchangebetweensailorandaction"

    assert_text "Exchangebetweensailorandaction was successfully created"
    click_on "Back"
  end

  test "updating a Exchangebetweensailorandaction" do
    visit exchangebetweensailorandactions_url
    click_on "Edit", match: :first

    fill_in "Person", with: @exchangebetweensailorandaction.person_id
    fill_in "Sailorandaction", with: @exchangebetweensailorandaction.sailorandaction_id
    click_on "Update Exchangebetweensailorandaction"

    assert_text "Exchangebetweensailorandaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Exchangebetweensailorandaction" do
    visit exchangebetweensailorandactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exchangebetweensailorandaction was successfully destroyed"
  end
end
