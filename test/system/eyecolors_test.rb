require "application_system_test_case"

class EyecolorsTest < ApplicationSystemTestCase
  setup do
    @eyecolor = eyecolors(:one)
  end

  test "visiting the index" do
    visit eyecolors_url
    assert_selector "h1", text: "Eyecolors"
  end

  test "creating a Eyecolor" do
    visit eyecolors_url
    click_on "New Eyecolor"

    fill_in "Name", with: @eyecolor.name
    click_on "Create Eyecolor"

    assert_text "Eyecolor was successfully created"
    click_on "Back"
  end

  test "updating a Eyecolor" do
    visit eyecolors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @eyecolor.name
    click_on "Update Eyecolor"

    assert_text "Eyecolor was successfully updated"
    click_on "Back"
  end

  test "destroying a Eyecolor" do
    visit eyecolors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Eyecolor was successfully destroyed"
  end
end
