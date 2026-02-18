require "application_system_test_case"

class HaircolorsTest < ApplicationSystemTestCase
  setup do
    @haircolor = haircolors(:one)
  end

  test "visiting the index" do
    visit haircolors_url
    assert_selector "h1", text: "Haircolors"
  end

  test "creating a Haircolor" do
    visit haircolors_url
    click_on "New Haircolor"

    fill_in "Name", with: @haircolor.name
    click_on "Create Haircolor"

    assert_text "Haircolor was successfully created"
    click_on "Back"
  end

  test "updating a Haircolor" do
    visit haircolors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @haircolor.name
    click_on "Update Haircolor"

    assert_text "Haircolor was successfully updated"
    click_on "Back"
  end

  test "destroying a Haircolor" do
    visit haircolors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Haircolor was successfully destroyed"
  end
end
