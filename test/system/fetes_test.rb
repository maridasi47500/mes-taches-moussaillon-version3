require "application_system_test_case"

class FetesTest < ApplicationSystemTestCase
  setup do
    @fete = fetes(:one)
  end

  test "visiting the index" do
    visit fetes_url
    assert_selector "h1", text: "Fetes"
  end

  test "creating a Fete" do
    visit fetes_url
    click_on "New Fete"

    fill_in "Date", with: @fete.date
    fill_in "Name de", with: @fete.name_de
    fill_in "Name en", with: @fete.name_en
    fill_in "Name fr", with: @fete.name_fr
    click_on "Create Fete"

    assert_text "Fete was successfully created"
    click_on "Back"
  end

  test "updating a Fete" do
    visit fetes_url
    click_on "Edit", match: :first

    fill_in "Date", with: @fete.date
    fill_in "Name de", with: @fete.name_de
    fill_in "Name en", with: @fete.name_en
    fill_in "Name fr", with: @fete.name_fr
    click_on "Update Fete"

    assert_text "Fete was successfully updated"
    click_on "Back"
  end

  test "destroying a Fete" do
    visit fetes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fete was successfully destroyed"
  end
end
