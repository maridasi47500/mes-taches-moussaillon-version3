require "application_system_test_case"

class EditionsTest < ApplicationSystemTestCase
  setup do
    @edition = editions(:one)
  end

  test "visiting the index" do
    visit editions_url
    assert_selector "h1", text: "Editions"
  end

  test "creating a Edition" do
    visit editions_url
    click_on "New Edition"

    fill_in "City", with: @edition.city
    fill_in "Closed", with: @edition.closed
    fill_in "Competition", with: @edition.competition
    fill_in "Country", with: @edition.country
    fill_in "Opened", with: @edition.opened
    fill_in "Year", with: @edition.year
    click_on "Create Edition"

    assert_text "Edition was successfully created"
    click_on "Back"
  end

  test "updating a Edition" do
    visit editions_url
    click_on "Edit", match: :first

    fill_in "City", with: @edition.city
    fill_in "Closed", with: @edition.closed
    fill_in "Competition", with: @edition.competition
    fill_in "Country", with: @edition.country
    fill_in "Opened", with: @edition.opened
    fill_in "Year", with: @edition.year
    click_on "Update Edition"

    assert_text "Edition was successfully updated"
    click_on "Back"
  end

  test "destroying a Edition" do
    visit editions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Edition was successfully destroyed"
  end
end
