require "application_system_test_case"

class OlympiceventsTest < ApplicationSystemTestCase
  setup do
    @olympicevent = olympicevents(:one)
  end

  test "visiting the index" do
    visit olympicevents_url
    assert_selector "h1", text: "Olympicevents"
  end

  test "creating a Olympicevent" do
    visit olympicevents_url
    click_on "New Olympicevent"

    fill_in "Name", with: @olympicevent.name
    click_on "Create Olympicevent"

    assert_text "Olympicevent was successfully created"
    click_on "Back"
  end

  test "updating a Olympicevent" do
    visit olympicevents_url
    click_on "Edit", match: :first

    fill_in "Name", with: @olympicevent.name
    click_on "Update Olympicevent"

    assert_text "Olympicevent was successfully updated"
    click_on "Back"
  end

  test "destroying a Olympicevent" do
    visit olympicevents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Olympicevent was successfully destroyed"
  end
end
