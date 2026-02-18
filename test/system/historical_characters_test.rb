require "application_system_test_case"

class HistoricalCharactersTest < ApplicationSystemTestCase
  setup do
    @historical_character = historical_characters(:one)
  end

  test "visiting the index" do
    visit historical_characters_url
    assert_selector "h1", text: "Historical Characters"
  end

  test "creating a Historical character" do
    visit historical_characters_url
    click_on "New Historical Character"

    fill_in "Image", with: @historical_character.image
    fill_in "Name", with: @historical_character.name
    click_on "Create Historical character"

    assert_text "Historical character was successfully created"
    click_on "Back"
  end

  test "updating a Historical character" do
    visit historical_characters_url
    click_on "Edit", match: :first

    fill_in "Image", with: @historical_character.image
    fill_in "Name", with: @historical_character.name
    click_on "Update Historical character"

    assert_text "Historical character was successfully updated"
    click_on "Back"
  end

  test "destroying a Historical character" do
    visit historical_characters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Historical character was successfully destroyed"
  end
end
