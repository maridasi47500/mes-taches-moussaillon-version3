require "application_system_test_case"

class MusicalinstrumentsTest < ApplicationSystemTestCase
  setup do
    @musicalinstrument = musicalinstruments(:one)
  end

  test "visiting the index" do
    visit musicalinstruments_url
    assert_selector "h1", text: "Musicalinstruments"
  end

  test "creating a Musicalinstrument" do
    visit musicalinstruments_url
    click_on "New Musicalinstrument"

    fill_in "Description", with: @musicalinstrument.description
    fill_in "Image", with: @musicalinstrument.image
    fill_in "Name", with: @musicalinstrument.name
    click_on "Create Musicalinstrument"

    assert_text "Musicalinstrument was successfully created"
    click_on "Back"
  end

  test "updating a Musicalinstrument" do
    visit musicalinstruments_url
    click_on "Edit", match: :first

    fill_in "Description", with: @musicalinstrument.description
    fill_in "Image", with: @musicalinstrument.image
    fill_in "Name", with: @musicalinstrument.name
    click_on "Update Musicalinstrument"

    assert_text "Musicalinstrument was successfully updated"
    click_on "Back"
  end

  test "destroying a Musicalinstrument" do
    visit musicalinstruments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Musicalinstrument was successfully destroyed"
  end
end
