require "application_system_test_case"

class HairlengthsTest < ApplicationSystemTestCase
  setup do
    @hairlength = hairlengths(:one)
  end

  test "visiting the index" do
    visit hairlengths_url
    assert_selector "h1", text: "Hairlengths"
  end

  test "creating a Hairlength" do
    visit hairlengths_url
    click_on "New Hairlength"

    fill_in "Name", with: @hairlength.name
    click_on "Create Hairlength"

    assert_text "Hairlength was successfully created"
    click_on "Back"
  end

  test "updating a Hairlength" do
    visit hairlengths_url
    click_on "Edit", match: :first

    fill_in "Name", with: @hairlength.name
    click_on "Update Hairlength"

    assert_text "Hairlength was successfully updated"
    click_on "Back"
  end

  test "destroying a Hairlength" do
    visit hairlengths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hairlength was successfully destroyed"
  end
end
