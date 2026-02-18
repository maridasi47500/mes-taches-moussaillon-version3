require "application_system_test_case"

class MymapsTest < ApplicationSystemTestCase
  setup do
    @mymap = mymaps(:one)
  end

  test "visiting the index" do
    visit mymaps_url
    assert_selector "h1", text: "Mymaps"
  end

  test "creating a Mymap" do
    visit mymaps_url
    click_on "New Mymap"

    fill_in "Height", with: @mymap.height
    fill_in "Image", with: @mymap.image
    fill_in "Width", with: @mymap.width
    click_on "Create Mymap"

    assert_text "Mymap was successfully created"
    click_on "Back"
  end

  test "updating a Mymap" do
    visit mymaps_url
    click_on "Edit", match: :first

    fill_in "Height", with: @mymap.height
    fill_in "Image", with: @mymap.image
    fill_in "Width", with: @mymap.width
    click_on "Update Mymap"

    assert_text "Mymap was successfully updated"
    click_on "Back"
  end

  test "destroying a Mymap" do
    visit mymaps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mymap was successfully destroyed"
  end
end
