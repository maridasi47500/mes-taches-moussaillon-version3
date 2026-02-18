require "application_system_test_case"

class SkinTypesTest < ApplicationSystemTestCase
  setup do
    @skin_type = skin_types(:one)
  end

  test "visiting the index" do
    visit skin_types_url
    assert_selector "h1", text: "Skin Types"
  end

  test "creating a Skin type" do
    visit skin_types_url
    click_on "New Skin Type"

    fill_in "Name", with: @skin_type.name
    click_on "Create Skin type"

    assert_text "Skin type was successfully created"
    click_on "Back"
  end

  test "updating a Skin type" do
    visit skin_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @skin_type.name
    click_on "Update Skin type"

    assert_text "Skin type was successfully updated"
    click_on "Back"
  end

  test "destroying a Skin type" do
    visit skin_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Skin type was successfully destroyed"
  end
end
