require "application_system_test_case"

class HistoricaleventsTest < ApplicationSystemTestCase
  setup do
    @historicalevent = historicalevents(:one)
  end

  test "visiting the index" do
    visit historicalevents_url
    assert_selector "h1", text: "Historicalevents"
  end

  test "creating a Historicalevent" do
    visit historicalevents_url
    click_on "New Historicalevent"

    fill_in "Image", with: @historicalevent.image
    fill_in "Name", with: @historicalevent.name
    click_on "Create Historicalevent"

    assert_text "Historicalevent was successfully created"
    click_on "Back"
  end

  test "updating a Historicalevent" do
    visit historicalevents_url
    click_on "Edit", match: :first

    fill_in "Image", with: @historicalevent.image
    fill_in "Name", with: @historicalevent.name
    click_on "Update Historicalevent"

    assert_text "Historicalevent was successfully updated"
    click_on "Back"
  end

  test "destroying a Historicalevent" do
    visit historicalevents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Historicalevent was successfully destroyed"
  end
end
