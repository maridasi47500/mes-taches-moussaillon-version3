require "application_system_test_case"

class StyleofmusicsTest < ApplicationSystemTestCase
  setup do
    @styleofmusic = styleofmusics(:one)
  end

  test "visiting the index" do
    visit styleofmusics_url
    assert_selector "h1", text: "Styleofmusics"
  end

  test "creating a Styleofmusic" do
    visit styleofmusics_url
    click_on "New Styleofmusic"

    click_on "Create Styleofmusic"

    assert_text "Styleofmusic was successfully created"
    click_on "Back"
  end

  test "updating a Styleofmusic" do
    visit styleofmusics_url
    click_on "Edit", match: :first

    click_on "Update Styleofmusic"

    assert_text "Styleofmusic was successfully updated"
    click_on "Back"
  end

  test "destroying a Styleofmusic" do
    visit styleofmusics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Styleofmusic was successfully destroyed"
  end
end
