require "application_system_test_case"

class EditionshaveeventsTest < ApplicationSystemTestCase
  setup do
    @editionshaveevent = editionshaveevents(:one)
  end

  test "visiting the index" do
    visit editionshaveevents_url
    assert_selector "h1", text: "Editionshaveevents"
  end

  test "creating a Editionshaveevent" do
    visit editionshaveevents_url
    click_on "New Editionshaveevent"

    fill_in "City", with: @editionshaveevent.city
    fill_in "Country", with: @editionshaveevent.country
    fill_in "Date", with: @editionshaveevent.date
    fill_in "Edition", with: @editionshaveevent.edition
    fill_in "Olympicevent", with: @editionshaveevent.olympicevent
    fill_in "Sexe", with: @editionshaveevent.sexe
    click_on "Create Editionshaveevent"

    assert_text "Editionshaveevent was successfully created"
    click_on "Back"
  end

  test "updating a Editionshaveevent" do
    visit editionshaveevents_url
    click_on "Edit", match: :first

    fill_in "City", with: @editionshaveevent.city
    fill_in "Country", with: @editionshaveevent.country
    fill_in "Date", with: @editionshaveevent.date
    fill_in "Edition", with: @editionshaveevent.edition
    fill_in "Olympicevent", with: @editionshaveevent.olympicevent
    fill_in "Sexe", with: @editionshaveevent.sexe
    click_on "Update Editionshaveevent"

    assert_text "Editionshaveevent was successfully updated"
    click_on "Back"
  end

  test "destroying a Editionshaveevent" do
    visit editionshaveevents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Editionshaveevent was successfully destroyed"
  end
end
