require "application_system_test_case"

class SkinColorsTest < ApplicationSystemTestCase
  setup do
    @skin_color = skin_colors(:one)
  end

  test "visiting the index" do
    visit skin_colors_url
    assert_selector "h1", text: "Skin Colors"
  end

  test "creating a Skin color" do
    visit skin_colors_url
    click_on "New Skin Color"

    fill_in "Name", with: @skin_color.name
    click_on "Create Skin color"

    assert_text "Skin color was successfully created"
    click_on "Back"
  end

  test "updating a Skin color" do
    visit skin_colors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @skin_color.name
    click_on "Update Skin color"

    assert_text "Skin color was successfully updated"
    click_on "Back"
  end

  test "destroying a Skin color" do
    visit skin_colors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Skin color was successfully destroyed"
  end
end
