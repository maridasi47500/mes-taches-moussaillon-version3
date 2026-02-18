require "application_system_test_case"

class SailorandactionsTest < ApplicationSystemTestCase
  setup do
    @sailorandaction = sailorandactions(:one)
  end

  test "visiting the index" do
    visit sailorandactions_url
    assert_selector "h1", text: "Sailorandactions"
  end

  test "creating a Sailorandaction" do
    visit sailorandactions_url
    click_on "New Sailorandaction"

    click_on "Create Sailorandaction"

    assert_text "Sailorandaction was successfully created"
    click_on "Back"
  end

  test "updating a Sailorandaction" do
    visit sailorandactions_url
    click_on "Edit", match: :first

    click_on "Update Sailorandaction"

    assert_text "Sailorandaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Sailorandaction" do
    visit sailorandactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sailorandaction was successfully destroyed"
  end
end
