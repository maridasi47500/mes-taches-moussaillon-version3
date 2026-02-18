require "application_system_test_case"

class HairtypesTest < ApplicationSystemTestCase
  setup do
    @hairtype = hairtypes(:one)
  end

  test "visiting the index" do
    visit hairtypes_url
    assert_selector "h1", text: "Hairtypes"
  end

  test "creating a Hairtype" do
    visit hairtypes_url
    click_on "New Hairtype"

    fill_in "Name", with: @hairtype.name
    click_on "Create Hairtype"

    assert_text "Hairtype was successfully created"
    click_on "Back"
  end

  test "updating a Hairtype" do
    visit hairtypes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @hairtype.name
    click_on "Update Hairtype"

    assert_text "Hairtype was successfully updated"
    click_on "Back"
  end

  test "destroying a Hairtype" do
    visit hairtypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hairtype was successfully destroyed"
  end
end
