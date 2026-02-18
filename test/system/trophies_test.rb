require "application_system_test_case"

class TrophiesTest < ApplicationSystemTestCase
  setup do
    @trophy = trophies(:one)
  end

  test "visiting the index" do
    visit trophies_url
    assert_selector "h1", text: "Trophies"
  end

  test "creating a Trophy" do
    visit trophies_url
    click_on "New Trophy"

    fill_in "Image", with: @trophy.image
    fill_in "Name", with: @trophy.name
    click_on "Create Trophy"

    assert_text "Trophy was successfully created"
    click_on "Back"
  end

  test "updating a Trophy" do
    visit trophies_url
    click_on "Edit", match: :first

    fill_in "Image", with: @trophy.image
    fill_in "Name", with: @trophy.name
    click_on "Update Trophy"

    assert_text "Trophy was successfully updated"
    click_on "Back"
  end

  test "destroying a Trophy" do
    visit trophies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trophy was successfully destroyed"
  end
end
