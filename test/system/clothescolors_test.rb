require "application_system_test_case"

class ClothescolorsTest < ApplicationSystemTestCase
  setup do
    @clothescolor = clothescolors(:one)
  end

  test "visiting the index" do
    visit clothescolors_url
    assert_selector "h1", text: "Clothescolors"
  end

  test "creating a Clothescolor" do
    visit clothescolors_url
    click_on "New Clothescolor"

    fill_in "Name", with: @clothescolor.name
    click_on "Create Clothescolor"

    assert_text "Clothescolor was successfully created"
    click_on "Back"
  end

  test "updating a Clothescolor" do
    visit clothescolors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @clothescolor.name
    click_on "Update Clothescolor"

    assert_text "Clothescolor was successfully updated"
    click_on "Back"
  end

  test "destroying a Clothescolor" do
    visit clothescolors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clothescolor was successfully destroyed"
  end
end
